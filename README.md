# Ansible ndench.environment role

[![Build Status](https://img.shields.io/travis/ndench/ansible-environment.svg)](https://travis-ci.org/ndench/ansible-environment)
[![Galaxy](http://img.shields.io/badge/galaxy-ndench.environment-blue.svg)](https://galaxy.ansible.com/ndench/environment)
[![GitHub Tags](https://img.shields.io/github/tag/ndench/ansible-environment.svg)](https://github.com/ndench/ansible-environment)
[![GitHub Stars](https://img.shields.io/github/stars/ndench/ansible-environment.svg)](https://github.com/ndench/ansible-environment)

> `ndench.environment` is an [Ansible](http://www.ansible.com) role which:
>
> * adds `/etc/environment` variables
> * adds php-fpm `pool.d/www.conf` variables
>
> Credit to the [franklinkim.environment](https://github.com/weareinteractive/ansible-environment) role which sets the system environment variables.

## Installation

Using `ansible-galaxy`:

```shell
$ ansible-galaxy install ndench.environment
```

Using `requirements.yml`:

```yaml
- src: ndench.environment
```

Using `git`:

```shell
$ git clone https://github.com/ndench/ansible-environment.git ndench.environment
```

## Dependencies

* Ansible >= 2.4

## Variables

Here is a list of all the default variables for this role, which are also available in `defaults/main.yml`.

```yaml
---

# A dictionary of environment files i.e
# environment_files:
#   # Keys can be anything, as long as they're unique
#   # They're used in the files section of each environment_config
#   env:
#     path: /etc/environment
#     format: system
#     owner: root
#     group: root
#
#   www.conf: 
#     path: /etc/php/7.1/fpm/pool.d/www.conf
#     format: php.ini
#     service: php7.1-fpm  # Service to restart once changes are made
environment_files:
    system:
        path: /etc/environment
        format: system

# A dictionary of config parameters i.e
# environment_config:
#   LC_ALL: 
#     value: en_US.UTF-8
#     environment_files: [env]  # Added to env environment_file
#   APP_ENV: 
#     value: prod
#     environment_files: [env, www.conf]  # Added to env and www.conf environment_files
#   APP_PASSWORD:
#     value: security
#     environment_files: [www.conf]  # Added to www.conf environment
environment_config: {}



```


## Usage

This is an example playbook:

```yaml
---

- hosts: all
  roles:
    - ndench.environment
  vars:
    environment_files:
      # Keys can be anything, as long as they're unique
      # They're used in the files section of each environment_config
      env:
        path: /etc/system.environment
        format: system
        owner: root
        group: root

      www.conf: 
        # Test box doesn't have php installed
        path: /etc/php.ini_pool.d_www.conf
        format: php.ini
        #service: php7.1-fpm  # Service to restart once changes are made

    environment_config:
      - key: LC_ALL
        value: en_US.UTF-8
        files: [env]  # Added to system environment
      - key: APP_ENV
        value: prod
        files: [env, www.conf]  # Added to system and php-fpm environments
      - key: APP_PASSWORD
        value: security
        files: [www.conf]  # Added to php-fpm environment

```


## Testing

```shell
$ git clone https://github.com/ndench/ansible-environment.git
$ cd ansible-environment
$ make test
```

## Contributing
In lieu of a formal style guide, take care to maintain the existing coding style. Add unit tests and examples for any new or changed functionality.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

*Note: To update the `README.md` file please install and run `ansible-role`:*

```shell
$ gem install ansible-role
$ ansible-role docgen
```

## License
Copyright (c) Nathan Dench under the MIT license.

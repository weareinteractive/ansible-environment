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

# Path to the environment files
system_environment_file: /etc/environment

# Set this to ennable php-fpm environment variables
php_fpm_environment_file: ''
# Set this if you want the php-fpm service restarted
php_fpm_service_name: ''

# The environment file owner
environment_file_owner: root
# The environment file group
environment_file_group: root
# A dictionary of config parameters i.e
#
# environment_config:
#   LC_ALL: en_US.UTF-8  # Added to system environment
#   APP_ENV: 
#     value: prod
#     environments: [system, php-fpm]  # Added to system and php-fpm environments
#   APP_PASSWORD:
#     value: security
#     environments: [php-fpm]  # Added to php-fpm environment
environment_config: {}

```


## Usage

This is an example playbook:

```yaml
---

- hosts: all
  roles:
    - franklinkim.environment
  vars:
    php_fpm_environment_file: /etc/php-fpm.www.conf
    php_fpm_service_name: '' # Specify this to restart the php-fpm service
    environment_config:
      LC_ALL: en_US.UTF-8  # Added to system environment
      APP_ENV: 
        value: prod
        environments: [system, php-fpm]  # Added to system and php-fpm environments
      APP_PASSWORD:
        value: security
        environments: [php-fpm]  # Added to php-fpm environment

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

## TODO:

Change the environment name from php-fpm to php.ini
Add ability to specify multiple files:

```yaml
environment_files:
    www.conf: 
        path: /etc/php-fpm.www.conf
        format: php.ini

    sys:
        path: /etc/environment
        format: system
        service: php7.1-fpm

environment_config:
    LC_ALL: en_US.UTF-8  # Added to system environment
    APP_ENV: 
        value: prod
        environment_files: [sys, www.conf]  # Added to system and php-fpm environments
    APP_PASSWORD:
        value: security
        environment_files: [www.conf]  # Added to php-fpm environment
```

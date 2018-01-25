# Ansible franklinkim.environment role

[![Build Status](https://img.shields.io/travis/weareinteractive/ansible-environment.svg)](https://travis-ci.org/weareinteractive/ansible-environment)
[![Galaxy](http://img.shields.io/badge/galaxy-weareinteractive.environment-blue.svg)](https://galaxy.ansible.com/weareinteractive/environment)
[![GitHub Tags](https://img.shields.io/github/tag/weareinteractive/ansible-environment.svg)](https://github.com/weareinteractive/ansible-environment)
[![GitHub Stars](https://img.shields.io/github/stars/weareinteractive/ansible-environment.svg)](https://github.com/weareinteractive/ansible-environment)

> `franklinkim.environment` is an [Ansible](http://www.ansible.com) role which:
>
> * adds `/etc/environment` variables
> * adds php-fpm `pool.d/www.conf` variables

## Installation

Using `ansible-galaxy`:

```shell
$ ansible-galaxy install franklinkim.environment
```

Using `requirements.yml`:

```yaml
- src: franklinkim.environment
```

Using `git`:

```shell
$ git clone https://github.com/weareinteractive/ansible-environment.git franklinkim.environment
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
$ git clone https://github.com/weareinteractive/ansible-environment.git
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
Copyright (c) We Are Interactive under the MIT license.

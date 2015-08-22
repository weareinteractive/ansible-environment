# Ansible Environment Role

[![Build Status](https://img.shields.io/travis/weareinteractive/ansible-environment.svg)](https://travis-ci.org/weareinteractive/ansible-environment)
[![Galaxy](http://img.shields.io/badge/galaxy-franklinkim.environment-blue.svg)](https://galaxy.ansible.com/list#/roles/1408)
[![GitHub Tags](https://img.shields.io/github/tag/weareinteractive/ansible-environment.svg)](https://github.com/weareinteractive/ansible-environment)
[![GitHub Stars](https://img.shields.io/github/stars/weareinteractive/ansible-environment.svg)](https://github.com/weareinteractive/ansible-environment)

> `environmanet` is an [Ansible](http://www.ansible.com) role which:
>
> * adds `/etc/environment` variables

## Installation

Using `ansible-galaxy`:

```
$ ansible-galaxy install franklinkim.environment
```

Using `requirements.yml`:

```
- src: franklinkim.environment
```

Using `git`:

```
$ git clone https://github.com/weareinteractive/ansible-environment.git franklinkim.environment
```

## Variables

Here is a list of all the default variables for this role, which are also available in `defaults/main.yml`.

```
# environment_config:
#   LC_ALL: en_US.UTF-8
#
environment_config:
```

## Example playbook

```
- hosts: all
  sudo: yes
  roles:
    - franklinkim.environment
  vars:
    environment_config:
      LC_ALL: C
```

## Testing

```
$ git clone https://github.com/weareinteractive/ansible-environment.git
$ cd ansible-environment
$ vagrant up
```

## Contributing

In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests and examples for any new or changed functionality.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
Copyright (c) We Are Interactive under the MIT license.

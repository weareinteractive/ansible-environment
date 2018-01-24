PWD=$(shell pwd)
ROLE_NAME=franklinkim.environment
ROLE_PATH=/etc/ansible/roles/$(ROLE_NAME)
TEST_VERSION=ansible --version
TEST_SYSTEM_SYNTAX=ansible-playbook -vv -i 'localhost,' -c local $(ROLE_PATH)/tests/test_system.yml --syntax-check
TEST_SYSTEM_PLAYBOOK=ansible-playbook -vv -i 'localhost,' -c local $(ROLE_PATH)/tests/test_system.yml
TEST_SYSTEM_PHP_FPM_SYNTAX=ansible-playbook -vv -i 'localhost,' -c local $(ROLE_PATH)/tests/test_system_php_fpm.yml --syntax-check
TEST_SYSTEM_PHP_FPM_PLAYBOOK=ansible-playbook -vv -i 'localhost,' -c local $(ROLE_PATH)/tests/test_system_php_fpm.yml
TEST_SYSTEM_CMD=$(TEST_VERSION); $(TEST_SYSTEM_SYNTAX); $(TEST_SYSTEM_PLAYBOOK)
TEST_SYSTEM_PHP_FPM_CMD=$(TEST_VERSION); $(TEST_SYSTEM_PHP_FPM_SYNTAX); $(TEST_SYSTEM_PHP_FPM_PLAYBOOK)

.PHONY: test
test:
	docker run -it --rm -e "ROLE_NAME=$(ROLE_NAME)" -v $(PWD):$(ROLE_PATH) williamyeh/ansible:ubuntu14.04 /bin/bash -c "$(TEST_SYSTEM_CMD)"
	docker run -it --rm -e "ROLE_NAME=$(ROLE_NAME)" -v $(PWD):$(ROLE_PATH) williamyeh/ansible:ubuntu14.04 /bin/bash -c "$(TEST_SYSTEM_PHP_FPM_CMD)"

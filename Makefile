PWD=$(shell pwd)
ROLE_NAME=franklinkim.environment
ROLE_PATH=/etc/ansible/roles/$(ROLE_NAME)
TEST_VERSION=ansible --version
TEST_DEFAULT_SYNTAX=ansible-playbook -vv -i 'localhost,' -c local $(ROLE_PATH)/tests/test_default.yml --syntax-check
TEST_DEFAULT_PLAYBOOK=ansible-playbook -vv -i 'localhost,' -c local $(ROLE_PATH)/tests/test_default.yml
TEST_MAIN_SYNTAX=ansible-playbook -vv -i 'localhost,' -c local $(ROLE_PATH)/tests/main.yml --syntax-check
TEST_MAIN_PLAYBOOK=ansible-playbook -vv -i 'localhost,' -c local $(ROLE_PATH)/tests/main.yml
TEST_DEFAULT_CMD=$(TEST_VERSION); $(TEST_DEFAULT_SYNTAX); $(TEST_DEFAULT_PLAYBOOK)
TEST_MAIN_CMD=$(TEST_VERSION); $(TEST_MAIN_SYNTAX); $(TEST_MAIN_PLAYBOOK)

.PHONY: test
test:
	docker run -it --rm -e "ROLE_NAME=$(ROLE_NAME)" -v $(PWD):$(ROLE_PATH) williamyeh/ansible:ubuntu14.04 /bin/bash -c "$(TEST_DEFAULT_CMD)"
	docker run -it --rm -e "ROLE_NAME=$(ROLE_NAME)" -v $(PWD):$(ROLE_PATH) williamyeh/ansible:ubuntu14.04 /bin/bash -c "$(TEST_MAIN_CMD)"

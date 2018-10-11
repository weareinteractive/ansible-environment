PWD=$(shell pwd)
ROLE_NAME=weareinteractive.environment
ROLE_PATH=/etc/ansible/roles/$(ROLE_NAME)
TEST_VERSION=ansible --version
TEST_SYNTAX=ansible-playbook -vv -i 'localhost,' -c local $(ROLE_PATH)/tests/main.yml --syntax-check
TEST_PLAYBOOK=ansible-playbook -vv -i 'localhost,' -c local $(ROLE_PATH)/tests/main.yml
TEST_CMD=$(TEST_VERSION); $(TEST_SYNTAX); $(TEST_PLAYBOOK)

ubuntu16.04: dist=ubuntu-16.04
ubuntu16.04: .run

ubuntu14.04: dist=ubuntu-14.04
ubuntu14.04: .run

.run:
	@docker run -it --rm -v $(PWD):$(ROLE_PATH) ansiblecheck/ansiblecheck:$(dist) /bin/bash -c "$(TEST_CMD)"

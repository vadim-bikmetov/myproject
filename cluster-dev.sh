#!/usr/bin/env bash

BASEDIR=`dirname $0`; cd $BASEDIR

export ANSIBLE_CONFIG="$BASEDIR/ansible.cfg"

echo "INSTALL DEPENDENCIES"
VENV='venv'
virtualenv $VENV
. $VENV/bin/activate
pip install --upgrade pip
pip install -r roles/flashvm/files/requirements-pip.txt
echo "CHECK VERSION"
ansible --version
python --version

ansible-galaxy install -f -r roles/flashvm/files/requirements-ansible.yml --ignore-errors
set -x

ADDITIONAL_EXTRA_VARS="order_username=$ORDER_USERNAME order_password=$ORDER_PASSWORD"

export EXTRA_VARS=""
EXTRA_VARS+="artifactory_login=$ARTIFACTORY_USER "
EXTRA_VARS+="artifactory_password=$ARTIFACTORY_PASSWORD "
EXTRA_VARS+="ansible_user=$CLOUD_USER "
EXTRA_VARS+="ansible_ssh_pass=$CLOUD_PASSWORD "
EXTRA_VARS+="user_username=$USER_NAME "
EXTRA_VARS+="user_userpassword=$USER_PASSWORD "
EXTRA_VARS+="service_description=$SERVICE_DESCRIPTION "
EXTRA_VARS+="orderby=$ORDERBY "
EXTRA_VARS+="workers_count=${WORKERS_COUNT:-5} "
EXTRA_VARS+="release_dir=BIS_UTF_BFAM_SEPARATE "
EXTRA_VARS+="vars=roles/flashvm/files/cloudform-vars.yml "
EXTRA_VARS+="expire=$EXPIRE "
EXTRA_VARS+="platform_name=$PLATFORM "

ansible-playbook flashvm.yml --extra-vars "$EXTRA_VARS $ADDITIONAL_EXTRA_VARS"
ansible-playbook -i inventory/cluster-dev/hosts.ini -b cluster-dev.yml --extra-vars "$EXTRA_VARS $ADDITIONAL_EXTRA_VARS"

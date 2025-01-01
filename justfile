
# Установка just - https://github.com/casey/just#installation

set positional-arguments
set export

# set shell := ["python3", "-c"]
set shell := ["bash", "-uc"]

[private]
default:
    @just --list --unsorted

simplecloud:
	ansible-playbook -i hosts.yml simplecloud.playbook.yml
get-token LOGIN PASSWORD:
    curl -d "{\"login\":\"{{LOGIN}}\",\"password\":\"{{PASSWORD}}\"}" -X POST -H'Content-Type:application/json;charset=UTF-8' -s https://simplecloud.ru/api/v3/auth/login | jq -r '.session_key'
commit +MESSAGE:
    git pull
    git add -A
    git commit -m "{{MESSAGE}}"
    git push

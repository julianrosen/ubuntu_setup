sudo apt install ssh

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

sudo install -m 0644 $SCIPT_DIR/10-no-password.conf /etc/ssh/sshd_config.d/

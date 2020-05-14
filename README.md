# jitsi-cloud-config

Automatically spin up a Jitsi Meet instance for personal / small office use in a couple of minutes.
You need a cloud provider supporting user data (cloud-config) input on VM creation.

This setup is not optimized for scaling.

## How to use - the simple way

- Copy `vars.bash.example` to `vars.bash` and adapt the variables explained there.
- Run `./make.sh` to generate `cloud.config.yaml`.
- Create a new Elastic IP (v4 and v6).
- Let a DNS A and AAAA record point to the Elastic IP.
- Create a new VM with a CentOS image and supply the content of `cloud-config.yaml` as user data.
- Assign the Elastic IP to your VM.
- Wait a couple of minutes.
- Register users with `ssh -t <your-server> ji-adduser <username>'` (interactively) or
`ssh <your-server> ji-adduser <username> <password>` (non-interactively).
- Enjoy your Jitsi Meet via Web using your DNS name :)

## Troubleshooting and Insights

- You can log in via SSH and follow the cloud-init output during setup
`tail -f /var/log/messages | grep cloud-init`.
- Currently, the custom logo is not applied automatically due to a missing trigger for the
`web` container being prepared. Use `ssh <your-server> ji-addlogo'` as soon as it is prepared.
- Persistency across reboots is currently not given but will be added soon. Reactivate a rebooted
instance with `/opt/app/jitsi/set_iptables; cd /opt/app; docker-compose up -d`

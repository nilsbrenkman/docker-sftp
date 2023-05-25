# SFTP image for unit test

Run a container with a sftp server. Add user data and keys to customize the image. Restart the container to reset it to the original state.

## How to use

Add a layer or volume to add you server keys, authorized ssh keys and user data

Keys go in ```/keys```; each file that has ```id_*.pub``` format is appended to ```.ssh/authorized_keys```

All files in ```/sshd``` are copied to ```/etc/ssh```; this allows you to put in your server keys and to customize the sshd_config

The folder ```/sftp``` is copied into the user's home directory, which will be the root directory of the sftp server. It will be made writable for the sftp user. If none provided, an empty directory will be created.

You need to specify a USER and PASSWD environment variable to create the sftp user.

### Example

```
docker run \
	--name "sftp" \
	-d \
	-v $(pwd)/keys:/keys \
	-v $(pwd)/sshd:/sshd \
	-v $(pwd)/sftp:/sftp \
	-p 2222:22 \
	-e USER=<user> \
	-e PASSWD=<pw> \
	sftp:latest
```
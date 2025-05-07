# Running ARM assembly on iPhone

## To build and run

- make sure your device is jailbroken and you have ssh access!
- you also need to know the local ip of your iphone.


- Use build_link_push.sh

```bash
Usage: build_link_push.sh <source.s> <output_binary> <ip_address> <remote_full_path>
```

### Example for running hello world ```hello.s```:

```bash
sh build_link_push.sh hello.s hello  192.168.1.100 /var/jb/var/tmp/
```

## DISCLAIMER:

- This is for educational purposes only, I am not responsible for bricked devices from using my repo!

- Use everything at your own risk!

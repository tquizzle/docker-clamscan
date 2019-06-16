# ClamAV scanning Docker image based on CentOS7

This image allows you a very simple way to scan a mounted filesystem using `clamscan`.

It will always update the ClamAV Database, by using the standard `freshclam` before running `clamscan`.

It is essentially, my centos version of [batmat's image](https://github.com/batmat/docker-clamscan)

![Docker Pulls](https://img.shields.io/docker/pulls/tquinnelly/clamav.svg?style=for-the-badge)

## How-To
Using this image is fairly straightforward. There are just a couple of things to keep in mind.

* Pay attention to `-v /path/to/scan` as this is the mounted directory that this docker image will scan.
* This container only runs once, then exits with the expected output below. If you want to scan again, you can simply start the container, it will update itself and start scanning.

### Running the container

```
docker run -it --name ClamAV \
  -v clamav-db:/var/lib/clamav \
  -v /path/to/scan:/scan:ro \
  tquinnelly/clamav -i
```

## Expected Output

```
# docker run -it --name ClamAV -v clamav-db:/var/lib/clamav -v /opt:/scan:ro tquinnelly/clamav -i
2019-06-13T23:11+0000 ClamAV scanning started
Updating ClamAV scan DB
ClamAV update process started at Thu Jun 13 23:11:48 2019
Downloading main.cvd [100%]
main.cvd updated (version: 58, sigs: 4566249, f-level: 60, builder: sigmgr)
Downloading daily.cvd [100%]
daily.cvd updated (version: 25479, sigs: 1593437, f-level: 63, builder: raynman)
Downloading bytecode.cvd [100%]
bytecode.cvd updated (version: 328, sigs: 94, f-level: 63, builder: neo)
Database updated (6159780 signatures) from database.clamav.net (IP: 104.16.218.84)
Freshclam updated the DB
Scanning /scan

----------- SCAN SUMMARY -----------
Known viruses: 6150472
Engine version: 0.101.2
Scanned directories: 3151
Scanned files: 20285
Infected files: 0
Data scanned: 2315.83 MB
Data read: 7582.24 MB (ratio 0.31:1)
Time: 883.476 sec (14 m 43 s)
2019-06-13T23:27+0000 ClamAV scanning finished
# 
```

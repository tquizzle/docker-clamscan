# ClamAV scanning Docker image based on CentOS7

This image allows you a very simple way to scan a mounted filesystem using `clamscan`.

It will always update the ClamAV Database, by using the standard `freshclam` before running `clamscan`.


## How-To
So you want to use this image, eh?
Ok.

```
docker run -ti \
           -v clamav-db:/var/lib/clamav \
           -v /path/to/scan:/scan:ro \
           clamtq:latest -i
```

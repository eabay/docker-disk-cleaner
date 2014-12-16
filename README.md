# Disk Cleaner

Periodically checks free space on path and deletes files to free up disk.

## Example
 Checks free space left where the path bind-mounted to `/data` volume and deletes 

```shell
docker run \
    -d \
    -v /messy/path:/data \
    -e DELETE_COUNT=5 \
    -e DELAY_TIME=60 \
    -e MIN_FREE_SPACE=100000 \
    mc2labs/disk-cleaner
```

The container created with this command checks free disk space every `60 seconds` on path `/messy/disk` and deletes `oldest 5 files` if free space on disk is `less then 100MB (100000KB)`

## Variables
| Variable       | Default | Unit    | Description                                 |
|----------------|---------|---------|---------------------------------------------|
| DELETE_COUNT   | 5       |         | Number of files to delete                   |
| DELAY_TIME     | 60      | seconds | Time to delay for the next execution        |
| MIN_FREE_SPACE |         | kbytes  | Minimum free space required to delete files |

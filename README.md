# openapi-generator

CLI docker image for the OpenAPI generator, enriched with a convenient yaml file parser [yq](https://github.com/mikefarah/yq).

## Usage

Print the generator version:
```bash
openapi-generator version
```


Run the generator (follows standard OpenAPI CLI signature):
```bash
openapi-generator generate -i input.yaml -g generator-name -o output/dir
```

Add additional options supported by the generator using the `--additional-properties="key=value,key2=value2"` comma-separated list.

## YAML file support

Please see the [yq](https://github.com/mikefarah/yq) documentation.
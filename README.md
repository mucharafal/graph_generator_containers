# Graph generator 
## Specify output size
- is [it](https://github.com/ldbc/ldbc_snb_datagen/wiki/Configuration#generator-parameters) enought? or it should be one parameter?
## What is done
 - created Dockerfile to create image with working [converter](https://github.com/PlatformLab/ldbc-snb-impls/tree/master/snb-interactive-neo4j)
 - to run:
    - build image using `build_image.sh`
    - adjust `run_converter.sh`- mounted `input` folder should contain `social_network` folder (output from generator)
    - run `run_converter.sh`
## Problems
 - converter fails during conversion files from `dynamic` folder (inside `social_network`). Most probably converter is not up to date with current output format or different output format in `params.ini` should be specified. Fails are on comment file. Log:
 ```
 Processing person properties...
Processing comment nodes (1 files)...
[WARNING] 
java.text.ParseException: Unparseable date: "1786706395137"
    at java.text.DateFormat.parse (DateFormat.java:395)
    at net.ellitron.ldbcsnbimpls.interactive.neo4j.util.DataFormatConverter.main (DataFormatConverter.java:466)
    at org.codehaus.mojo.exec.ExecJavaMojo$1.run (ExecJavaMojo.java:254)
    at java.lang.Thread.run (Thread.java:834)
```
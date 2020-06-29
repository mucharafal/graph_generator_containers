git clone https://github.com/ldbc/ldbc_snb_datagen
cd ldbc_snb_datagen
docker build . --tag ldbc/datagen
cd ..
./build_image.sh

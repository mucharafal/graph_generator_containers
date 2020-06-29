mkdir input
cp $1 input/params.ini
cd input
rm -rf social_network/ substitution_parameters && \
  docker run --rm --mount type=bind,source="$(pwd)/",target="/opt/ldbc_snb_datagen/out" --mount type=bind,source="$(pwd)/params.ini",target="/opt/ldbc_snb_datagen/params.ini" ldbc/datagen; \
  sudo chown -R $USER:$USER social_network/ substitution_parameters/
sed -i "1s/.*/creationDate|Forum.id|Person.id|type|joinDate/" ./input/social_network/merged/forum_hasMember_person_0_0.csv
./execute_on_all_files.sh ./input/social_network/merged

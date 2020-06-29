for file in $1/*; do
    python3 remove_creation_date_column.py $file
done
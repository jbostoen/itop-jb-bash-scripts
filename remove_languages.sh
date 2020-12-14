# Beware: files will be deleted if you uncomment the line with "Deleted" in it.
# Adjust path of iTop directory
# Adjust the line with (en|nl) to languages you want to keep. Example (en|fr|nl)
iTopDir="/var/www/html/itop/web"
find $iTopDir -type f -regex ".*/.+\.dict\..+\.php" -exec bash -c '
        for item do
                short_name=${item##*/}

                [[ $short_name =~ ^[a-z_]+\.(dict|dictionary)\..* && ! $short_name =~ ^(en|fr|nl) ]] && echo "[X] $short_name" || echo "[ ] $short_name"
                # [[ $short_name =~ ^[a-z_]+\.(dict|dictionary)\..* && ! $short_name =~ ^(en|fr|nl) ]] && rm $item &&  echo "    Deleted"
        done
' bash {} +

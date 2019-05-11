sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/20\3-\2-\1/' data.csv > deta1.csv
sed 's/;N/;\\N/' deta1.csv > deta2.csv
sed 's/;;/;\\N;/' deta2.csv > deta3.csv
sed 's/\([0-9][0-9][0-9]\);\([0-9]\)/\1,\2/' deta3.csv > deta4.csv
sed 's/\([0-9][0-9][0-9]\),\([0-9]\)/\1.\2/' deta4.csv > deta5.csv
sed 's/;/,/g' deta5.csv > deta6.csv
sed 's/,\r/,\\N/g' deta6.csv > deta7.csv
sed '/\\N/d' deta7.csv > data_final.csv
rm deta*

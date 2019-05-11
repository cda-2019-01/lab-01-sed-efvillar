sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/20\3-\2-\1/' data.csv > deta1.csv
sed 's/;N/;\\N/' deta1.csv > deta2.csv
sed 's/;;/;\\N;/' deta2.csv > deta3.csv
sed 's/\([0-9][0-9][0-9]\);\([0-9]\)/\1,\2/' deta3.csv > deta4.csv
sed 's/\([0-9][0-9][0-9]\),\([0-9]\)/\1.\2/' deta4.csv > deta5.csv
sed 's/;/,/g' deta5.csv > deta6.csv
#sed 's/,$/,\\N/g' deta6.csv > deta7.csv
sed 's/,/,\\N/3g' deta6.csv > deta7.csv
sed 's/\\N\\N/\\N/' deta7.csv > deta8.csv
sed 's/\\N\([0-9]\)/\1/' deta8.csv > deta9.csv
sed '/\\N/d' deta9.csv > data_final.csv
rm deta*

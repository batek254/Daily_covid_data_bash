#script to obtain number of cases in any country
curl https://www.worldometers.info/coronavirus/#countries > tmp_file
date=$(date +"%d/%m/%Y")
hour=$(date +"%H:%M:%S")
country=$1
new_cases=$(cat tmp_file | grep -m1 -A2 $1 | cut -d'>' -f2 | cut -d'<' -f1 | cut -d'+' -f2 | sed -n '3p')
#cases=$(cat tmp_file | grep "style=\"color:#aaa\"" | cut -d">" -f2 | cut -d"<" -f1)
echo "$date;$hour;$new_cases;$country" >> total_covid_cases.csv

rm tmp_file


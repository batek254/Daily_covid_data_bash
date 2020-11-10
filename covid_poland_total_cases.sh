#script to obtain number of cases in Poland
curl https://www.worldometers.info/coronavirus/country/poland/ > tmp_file
date=$(date +"%d/%m/%Y")
hour=$(date +"%H:%M:%S")
cases=$(cat tmp_file | grep "style=\"color:#aaa\"" | cut -d">" -f2 | cut -d"<" -f1)
echo "$date;$hour;$cases" >> total_covid_cases.csv

rm tmp_file


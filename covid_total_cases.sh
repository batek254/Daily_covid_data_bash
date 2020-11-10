#script to obtain number of cases in any country
################################################################################
# Help                                                                         #
################################################################################
Help()
{
	#Help
	echo "Syntax: script [-h/country_name]"
	echo "Country name must be Capitalized and matched with worldometer website"
	echo
	echo "h		Print this Help"
	echo
}

################################################################################
# Main program                                                                 #
################################################################################
################################################################################
# Process the input options               			               #
################################################################################
# Get the options
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
	 exit;;
   esac
done
#saving html to tmp_file
curl https://www.worldometers.info/coronavirus/#countries > tmp_file
#creating date arg
date=$(date +"%d/%m/%Y")
#creating hour arg
hour=$(date +"%H:%M:%S")
#creating country arg
country=$1
#web scraping new covid cases
new_cases=$(cat tmp_file | grep -m1 -A2 $1 | cut -d'>' -f2 | cut -d'<' -f1 | cut -d'+' -f2 | sed -n '3p')
#cases=$(cat tmp_file | grep "style=\"color:#aaa\"" | cut -d">" -f2 | cut -d"<" -f1)
#web scraping new deaths
new_deaths=$(cat tmp_file | grep -m1 -A5 Poland | cut -d'>' -f2 | cut -d'<' -f1 | cut -d'+' -f2 | sed -n '6p')
#saving results to csv
echo "$date;$hour;$new_cases;$new_deaths;$country" >> total_covid_cases.csv
#removing tmp_file
rm tmp_file


function battery_meter()
{
	local fgdefault='#[default]'
	# Get battery status
	charge_base="Now drawing from"
	if [[ $(pmset -g batt | grep -Eo "$charge_base 'AC Power'") ]];
	then
		local icon='⚡'
		local charging='⬆️' 
	else
		local icon='🔋'
		local charging='⬇️'
	fi
		
	batt=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
	batt="$batt%"	

	case $batt in
		100%|9[0-9]%|8[0-9]%|7[5-9]%) fgcolor='#[fg=brightgrey]'
				;;

		7[0-4]%|6[0-9]%|5[0-9]%) fgcolor='#[fg=brightgreen]'
				;;

		4[0-9]%|3[0-9]%|2[5-9]%) fgcolor='#[fg=brightyellow]'
				;;
		2[0-4]%|1[0-9]%|[0-9]%) fgcolor='#[fg=brightred]'
				;;
	esac
	printf "%s " "${fgcolor}${icon}${batt}${charging}${fgdefault}"
}

function date_time() {
	printf "%s " "$(date +'%Y-%m-%d %H:%M:%S %Z')"
}

function branch_name() {
	cd $1
	name=$(git rev-parse --abbrev-ref HEAD)
	if [[ $name ]];
	then
		printf "Branch %s " $name
	fi
}

branch_name $1
battery_meter
date_time

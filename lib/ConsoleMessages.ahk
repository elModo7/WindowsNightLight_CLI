initCLIMessages() {
	global
	cliLoudWarningMessage(appName " v" version " - elModo7 / VictorDevLog - " A_YYYY)
	cliInfoMessage(i18n.t("cli_version_in_beta", {app: appName}))
}

cliInfoMessage(msgTxt) {
	global
	msg := chalk.cyan(msgTxt "`r`n")
	FileAppend, %msg%, *
}

cliSuccessMessage(msgTxt) {
	global
	msg := chalk.green(msgTxt "`r`n")
	FileAppend, %msg%, *
}

cliLoudSuccessMessage(msgTxt) {
	global
	msg := chalk.bold.green.underline(msgTxt "`r`n")
	FileAppend, %msg%, *
}

cliWarningMessage(msgTxt) {
	global
	msg := chalk.yellow(msgTxt "`r`n")
	FileAppend, %msg%, *
}

cliLoudWarningMessage(msgTxt) {
	global
	msg := chalk.bold.yellow.underline(msgTxt "`r`n")
	FileAppend, %msg%, *
}

cliErrorMessage(msgTxt) {
	global
	msg := chalk.red(msgTxt "`r`n")
	FileAppend, %msg%, *
}

cliLoudErrorMessage(msgTxt) {
	global
	msg := chalk.bold.red.underline(msgTxt "`r`n")
	FileAppend, %msg%, *
}

# Kapacitor-Unit
## Installation

 1. Navigate to the `scripts` folder.
 2. Run the command: `./initKapacitorUnit.sh`
 3. Next, export the path variable with this command: `export PATH=$PATH:/usr/local/go/bin`
	 > This makes Kapacitor-Unit runnable from all locations
	 
 5. Kapacitor-Unit is now set up!
 
 ## Writing Unit Tests
There are two parts to writing unit tests with Kapacitor-Unit:
 1. The framework takes a YAML file as an input with cofigurations for each test to be run. 
 2. Some TICK scripts require modification to be compatable with the framework. This is because, being an open source project, Kapacitor-Unit only supports a specific format of TICK script. 
	 >For example, having a window clause in the query will cause Kapacitor-Unit to not work correctly, so it needs to be commented out of the test version of a script.

**Here is an example of a unit test configuration in the YAML file:**
```
 - name: "Spid Blocking Alert:: warning when blocking is recorded"
	task_name: spid_blocking_alert_tester.tick
	db: telegraf
	rp: autogen
	type: stream
	data:
		- processes blocked=0
		- processes blocked=6
	expects:
	ok: 0
	warn: 1
	crit: 0
```
**Things to Note about this unit test:**
  1. The `task_name` field is where you specify the TICK script that you wish to test.
  2. Under data, `processes` is the name of the measurement and `blocked` is the column being used in the script logic to trigger an alert. 
  3. The `expects` section is where you assert what behavior the script should have when given the data above, in this case the test is expecting the script to return one warning.   
 
**Here is the corresponding test script:**
```
dbrp "telegraf"."autogen"
stream
	|from()
		.measurement('processes')
		.groupBy('host','blocked')
	//|window()
		//.period(1m)
		//.every(1m)
	|alert()
		.warn(lambda: "blocked" > 5)
		.message('warning: There is proccess blocking on Host: {{ index .Tags "host" }} ')
		//.slack()
		.stateChangesOnly()
```
**Things to note about this test script:**

 1. Notice that the `|window()` clause is commented out, this is because it causes the unit test to not work properly. Usually by not producing any alerts which causes the test to fail if it is expecting an alert.
 2. The `.slack()` function is commented out. Since Kapacitor-Unit uses Kapacitor to run its tests, any alerts triggered by a unit test will be sent to the Slack web hook that is configured with the Kapacitor installation. To prevent this, we simply comment out the Slack function.
 
 ## Running Unit Tests
 The command for running Kapacitor-Unit is farly long and obscure, so we made a script for it so that it would be easy to run.

1. Navigate to the `scripts` folder.
2. Run the command: `./testTickScripts.sh`

**The output should look something like this:**
**![](https://lh4.googleusercontent.com/0L6EdSdhYAg_fMgqN0Z8Gmb-gEWgkQ-imP4rBPGbcaYm2W-POTh2TtRr-fgdPnb7L7Q7d8avZU62q03B1aoZ3Ab1Nz_1i1YvPoyddl8VI5ftUVg-Xm3SdvRLB-3QgJa7-auP5Q7b)**

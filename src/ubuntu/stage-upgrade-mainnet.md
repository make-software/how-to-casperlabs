### Stage the upgrades
"Staging an upgrade" is a process in which you tell your node to download the upgrade files and prepare them, so that they can automatically be applied at the pre-defined activation point. 

The same ```node_util.py stage_protocols``` script used earlier will stage available upgrades for your node since when you started it.  There is no harm in running it multiple times as it will not re-stage any already loaded.

# exlibris-sgsnap
## Usage:
 _#snapgroupsnap1.bash <snap group name> <string_to_search_in_snap_name> <string_to_replace_with_in_snap_name>_
  
### for instance
  _#snapgroupsnap1.bash mysnapgroup lab qa_
 
it will create a writeable snapshot to all snapshots within a specified snap group, will assign the following name to each 
<Original_Snap_Name_with_replaced_string><SUFFIX>
  
  
 ## Parameters to set inside the script ##
 
* IBOX_USER - User with Pool admin / Admin rights to the InfiniBox
* IBOX_PW - Password for the user specified as IBOX_USER
* IBOX_IP - IP or FQDN for the InfiniBox 
* SUFFIX (set to -clone)
 
## Notes
* No need to provide consistency group name - only snap group name.
* a page size of 100 is being used. 
* jq (https://stedolan.github.io/jq/) has to be installed 

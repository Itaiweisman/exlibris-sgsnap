# exlibris-sgsnap
## Usage:
  snapgroupsnap1.bash <snap group name> <string_to_search_in_snap_name> <string_to_replace_with_in_snap_name>
  
### for instance
  snapgroupsnap1.bash mysnapgroup lab qa
 
it will create a writeable snapshot to all snapshots within a specified snap group, will assign the following name to each 
<Original_Snap_Name_with_replaced_string><SUFFIX>
  
  
 ## Parameters to set inside the script ##
 
* IBOX_USER - User with Pool admin / Admin rights to the InfiniBox
* IBOX_PW - Password for the user specified as IBOX_USER
* IBOX_IP - IP or FQDN for the InfiniBox 
* SUFFIX (set to -clone)
 
 

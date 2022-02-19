//---------------------------------------------------------------------------------
// get_plugins.groovy
//---------------------------------------------------------------------------------
// Used to run inside Jenkins script console to get list of sorted plugins
//---------------------------------------------------------------------------------

def pluginList = new ArrayList(Jenkins.instance.pluginManager.plugins)
pluginList.sort { it.getShortName() }.each{
  plugin -> 
    println ("${plugin.getDisplayName()} (${plugin.getShortName()}): ${plugin.getVersion()}")
}
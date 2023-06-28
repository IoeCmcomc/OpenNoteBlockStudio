{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "FileDropper",
  "androidactivityinject": "",
  "androidclassname": "",
  "androidcodeinjection": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidPermissions": [],
  "androidProps": false,
  "androidsourcedir": "",
  "author": "",
  "classname": "",
  "copyToTargets": 202375362,
  "date": "2019-05-07T04:22:47",
  "description": "",
  "exportToGame": true,
  "extensionVersion": "1.0.0",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"hwnd_main","hidden":false,"value":"window_handle()",},
        {"resourceType":"GMExtensionConstant","resourceVersion":"1.0","name":"hwnd_default","hidden":false,"value":"pointer_null",},
      ],"copyToTargets":66,"filename":"FileDropper.dll","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_dnd_get_enabled","argCount":-1,"args":[],"documentation":"","externalName":"file_dnd_get_enabled","help":"file_dnd_get_enabled()","hidden":false,"kind":12,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_dnd_set_enabled","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"file_dnd_set_enabled","help":"file_dnd_set_enabled(enable)","hidden":false,"kind":12,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_dnd_get_files","argCount":-1,"args":[],"documentation":"","externalName":"file_dnd_get_files","help":"file_dnd_get_files()","hidden":false,"kind":12,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_dnd_set_files","argCount":4,"args":[
            1,
            2,
            2,
            2,
          ],"documentation":"","externalName":"file_dnd_set_files","help":"file_dnd_set_files(pattern,allowfiles,allowdirs,allowmulti)","hidden":false,"kind":12,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_dnd_get_hwnd","argCount":0,"args":[],"documentation":"","externalName":"file_dnd_get_hwnd","help":"file_dnd_get_hwnd()","hidden":false,"kind":1,"returnType":1,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"file_dnd_set_hwnd","argCount":0,"args":[
            1,
          ],"documentation":"","externalName":"file_dnd_set_hwnd","help":"file_dnd_set_hwnd(hwnd)","hidden":false,"kind":1,"returnType":2,},
      ],"init":"","kind":1,"order":[
        {"name":"file_dnd_get_enabled","path":"extensions/FileDropper/FileDropper.yy",},
        {"name":"file_dnd_set_enabled","path":"extensions/FileDropper/FileDropper.yy",},
        {"name":"file_dnd_get_files","path":"extensions/FileDropper/FileDropper.yy",},
        {"name":"file_dnd_set_files","path":"extensions/FileDropper/FileDropper.yy",},
        {"name":"file_dnd_get_hwnd","path":"extensions/FileDropper/FileDropper.yy",},
        {"name":"file_dnd_set_hwnd","path":"extensions/FileDropper/FileDropper.yy",},
      ],"origname":"extensions\\FileDropper.dll","ProxyFiles":[
        {"resourceType":"GMProxyFile","resourceVersion":"1.0","name":"FileDropper.dylib","TargetMask":1,},
      ],"uncompress":false,"usesRunnerInterface":false,},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[],"copyToTargets":0,"filename":"FileDropper.dll.zip","final":"","functions":[],"init":"","kind":4,"order":[],"origname":"extensions\\FileDropper.dll.zip","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[],"copyToTargets":0,"filename":"FileDropper.dylib.zip","final":"","functions":[],"init":"","kind":4,"order":[],"origname":"extensions\\FileDropper.dylib.zip","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject": "",
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "HTML5CodeInjection": "",
  "html5Props": false,
  "IncludedResources": [],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "",
  "ioscodeinjection": "",
  "iosdelegatename": "",
  "iosplistinject": "",
  "iosProps": false,
  "iosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "license": "Free to use, also for commercial games.",
  "maccompilerflags": "",
  "maclinkerflags": "",
  "macsourcedir": "",
  "options": [],
  "optionsFile": "options.json",
  "packageId": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
  "productId": "",
  "sourcedir": "",
  "supportedTargets": 202375362,
  "tvosclassname": "",
  "tvosCocoaPodDependencies": "",
  "tvosCocoaPods": "",
  "tvoscodeinjection": "",
  "tvosdelegatename": "",
  "tvosmaccompilerflags": "",
  "tvosmaclinkerflags": "",
  "tvosplistinject": "",
  "tvosProps": false,
  "tvosSystemFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
}
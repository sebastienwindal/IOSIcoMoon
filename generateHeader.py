#!/usr/bin/python

from xml.dom import minidom

icoMoonFile = open("IcomoonIcons.h", "w")

icoMoonFile.write(  "//\n" + 
                    "//  IcomoonIcons.h\n" + 
                    "//\n" +
                    "//  Generated from icomoon.dev.svg.\n" +
                    "//\n\n\n" +
                    "#ifndef Icomoon_Icons_h\n" +
                    "#define Icomoon_Icons_h\n\n\n")

doc = minidom.parse('icomoon.dev.svg')  # parseString also exists

# name each unicode character using its first tag...
path_strings = [    
                    [   
                        path.getAttribute('unicode'), 
                        path.getAttribute('data-tags')
                            .split(", ")[0]
                            .encode('ascii', 'ignore')
                            .upper()
                            .replace("-", "_")
                    ] 
                    for path in doc.getElementsByTagName('glyph')
                ]

alreadyUsedNames = {}

for key in path_strings:

    if key[1].__len__() > 0:
        suffix = ""
        if key[1] in alreadyUsedNames:
            alreadyUsedNames[key[1]] = alreadyUsedNames[key[1]] + 1
            lastNumber = alreadyUsedNames[key[1]]
            suffix = "_%d" % lastNumber
        else:
            alreadyUsedNames[key[1]] = 0

        icoMoonFile.write(u'#define  ICOMOON_' + key[1] + suffix + ' "\\u%04X"\n' % (ord(key[0])))


doc.unlink()

icoMoonFile.write("\n\n#endif");
icoMoonFile.close();
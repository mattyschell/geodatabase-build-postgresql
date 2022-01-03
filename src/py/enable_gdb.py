import os
import arcpy

class Gdb(object):

    def __init__(self
                ,ptargetsdeconn):

        self.sdeconn = ptargetsdeconn

    def enable(self,
               authfile):
            
        try:
            arcpy.EnableEnterpriseGeodatabase_management(self.sdeconn, 
                                                         authfile)
        
        except:
            print ("{0}".format(arcpy.GetMessages()))
            print ("using {0} and {1}".format(self.sdeconn,
                                              authfile))
            raise ValueError('Failure on enable enterprise gdb from ArcGIS')

        
        print ("".format(arcpy.GetMessages()))

if __name__ == '__main__':

    ptargetsdeconn = os.environ['SDEFILE']
    pkeycodes = os.environ['AUTHFILE']

    babygdb = Gdb(ptargetsdeconn)

    try: 
        babygdb.enable(pkeycodes)
        exitcode = 0
    except:
        exitcode = 1

    exit(exitcode)


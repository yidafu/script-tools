import os
from PIL import Image, ImageDraw

deal_path = '/home/yidafu/temp/deal/'

list = [9070,9135,9235,9263,9291,9551,9591,9666,9778]

# for jpg in range( 9986, 9999 ) :
for jpg in list :
    print( jpg )
    file_path =  deal_path + str(jpg) + ".jpg"
    img = Image.open( file_path, 'r' )
    img.show()
    changed_name = input("image name change to: ")
    img.save( deal_path + "../res/" + changed_name + ".jpg" )
    info = "copy " + file_path + " to " + "../res/" + changed_name + ".jpg"
    # if not os.system( cmd ) :
    print("success: " + info )
    img.close()

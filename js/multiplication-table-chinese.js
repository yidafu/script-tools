#!/usr/bin/env node

console.log(

    ['一','二','三','四','五','六','七','八','九'].map( function( character, rowIndex, self ) {
        return self.slice(0, rowIndex + 1).map( function( col, colIndex ) {
            return self[ colIndex ] + "" + self[ rowIndex ]
                    + ( ( rowIndex + 1 ) * ( colIndex + 1 ) < 10 ? "得" : "")
                    + ( ( rowIndex + 1 ) * ( colIndex + 1 ) )
                        .toString().split("").map(
                             val => val == 0 ? "" : self[ val - 1 ]
                        ).join( "十" )
        } ).join( "\t" ).toString()
    } ).join( "\n" ).toString()

)

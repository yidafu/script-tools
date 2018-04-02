#!/usr/bin/env node

console.log(

    [1,2,3,4,5,6,7,8,9].map( function( line, index, self ) {
        return self.slice(0, index + 1).map( function( col ) {
             return line + "*" + col + "=" + ( line * col )
        } ).join( "\t" ).toString()
    } ).join( "\n" ).toString()

)

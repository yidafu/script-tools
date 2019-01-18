const fs = require('fs')
const path = require('path')

const whitelist = [
  '.git',
  'src',
  'config',
  'build',
  'static',
  'dist',
  'scripts',
]
/**
 * 
 * @param {string} dirPath 
 */
function rmDir( dirPath ) {
  /**
   * map to rm file
   */
  traversingDirs( dirPath, ( path, file ) => {
    if( file.isDirectory() ) {
      fs.rmdirSync( path )
    } else {
      fs.unlinkSync( path )
    }
  })
  /*
  rm root dir
  */
 fs.rmdirSync( dirPath )
}

/**
 * 
 * @param {string} dirPath default '.'
 * @param {Function} callback default () => undefined
 */
function traversingDirs( dirPath = '.', callback = () => undefined ) {
  
  const currentFiles = fs.readdirSync( dirPath, { withFileTypes: true} )

  for ( const file of currentFiles ) {
    const childFilePath = path.join( dirPath, file.name )
    if (file.isDirectory() && !whitelist.includes( file.name ) ) {
      traversingDirs( childFilePath, callback )
    }
    callback( childFilePath, file ) 
  }
  
}

// call the traversingDirs function.
traversingDirs( __dirname + '/../..', function( path, dir ) {
  if( dir.isDirectory() &&  dir.name === 'node_modules' ) {
    rmDir( path )
  }
})
import flow2ts from 'flow2typescript';
import Glob from 'glob';
import fs from 'fs';

const fsp = fs.promises;

const REACT_BASE_DIR = '/Users/yidafu/github/react';

const TRANS_PACKAGES = [
  'react',
  'react-dom',
  'scheduler',
  'react-reconciler',
  "react-is"
];

TRANS_PACKAGES.forEach(packageName => {
  // /Users/yidafu/github/react/packages/scheduler
  Glob(REACT_BASE_DIR + '/packages/' + packageName + "/src/**/*.js", (err, jsFilepaths) => {
    if (err) {
      console.log(err);
      return;
    }
    jsFilepaths.forEach(async (jsFilepath) => {
      if (jsFilepath.includes('__tests__')) return;
      const fileContent = await fsp.readFile(jsFilepath);
      flow2ts.compile(fileContent.toString(), jsFilepath)
        .then(tsContent => {
          const tsFilepath = jsFilepath.substring(0, jsFilepath.lastIndexOf('.')) + '.ts';

          console.log("success compile: " + tsFilepath);
          fsp.writeFile(tsFilepath, tsContent);
        }).catch(err => {
          console.log(jsFilepath);
        });
    });
  });  
});

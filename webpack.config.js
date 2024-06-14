const path = require('path');

module.exports = {
    mode: 'development', // or 'production'
    entry: './src/index.js',
    output: {
        filename: 'bundle.js',
        path: path.resolve(__dirname, 'dist')
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                use: {
                    loader: 'babel-loader'
                }
            }
        ]
    },
    resolve: {
        fallback: {
            fs: false,
            net: false,
            tls: false,
            crypto: require.resolve('crypto-browserify'), // for 'crypto'
            zlib: require.resolve('browserify-zlib'),     // for 'zlib'
            timers: require.resolve('timers-browserify'),  // for 'timers'
            "stream": require.resolve("stream-browserify"),
            "path": require.resolve("path-browserify"),
            "util": require.resolve("util.promisify"),
            "async_hooks": false, // Do not polyfill async_hooks
            "os": require.resolve("os-browserify/browser"),
            "querystring": require.resolve("querystring-es3"),
            "vm": require.resolve("vm-browserify"),
            "http": require.resolve("stream-http")
        }
    },
    stats: {
        errorDetails: true // Show detailed error information
    }
};

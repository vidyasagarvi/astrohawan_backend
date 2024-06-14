import path from 'path';

module.exports = {
    entry: './src/index.js', // Entry point of your application
    output: {
        filename: 'bundle.js', // Output file name
        path: path.resolve(__dirname, 'dist') // Output directory
    },
    module: {
        rules: [
            {
                test: /\.js$/, // Apply this rule to all .js files
                exclude: /node_modules/, // Exclude node_modules
                use: {
                    loader: 'babel-loader', // Use Babel loader to transpile JavaScript
                    options: {
                        presets: ['@babel/preset-env'] // Use preset-env for ES6+ features
                    }
                }
            }
        ]
    }
};

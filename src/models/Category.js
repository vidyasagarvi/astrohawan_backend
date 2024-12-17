class Category {
    constructor(id, translations = [],products = []) {
        this._id = id;
        this._translations = translations;
        this._products = products;
    }

    get id() {
        return this._id;
    }

    get translations() {
        return this._translations;
    }

    get products() {
        return this._products;
      }

    addTranslation(languageCode, name, description) {
        this._translations.push({ language_code: languageCode, name: name , description: description});
    }

    getTranslation(languageCode) {
        return this._translations.find(translation => translation.language_code === languageCode);
    }

    addProduct(product) {
        this._products.push(product);
      }

}

export default Category;

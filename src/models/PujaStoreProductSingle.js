class PujaStoreProductSingle {
    constructor(id, images, price, discount, status, translations, category) {
        this._id = id;
        this._images = images || [];
        this._price = price || 0;
        this._discount = discount || 0;
        this._status = status;
        this._translations = translations || [];
        this._category = category || {};
    }

    // Getters
    get id() {
        return this._id;
    }

    get images() {
        return this._images;
    }

    get price() {
        return this._price;
    }

    get discount() {
        return this._discount;
    }

    get status() {
        return this._status;
    }

    get translations() {
        return this._translations;
    }

    get category() {
        return this._category;
    }

    // Setters
    set id(id) {
        this._id = id;
    }

    set images(images) {
        this._images = images;
    }

    set price(price) {
        this._price = price;
    }

    set discount(discount) {
        this._discount = discount;
    }

    set status(status) {
        this._status = status;
    }

    set translations(translations) {
        this._translations = translations;
    }

    set category(category) {
        this._category = category;
    }

    // Method to add a translation for a specific language
    addTranslation(languageCode, title, description) {
        this._translations.push({ language_code: languageCode, title: title, description: description });
    }

    // Method to add an image
    addImage(imageUrl) {
        this._images.push(imageUrl);
    }

    // Method to get translation for a specific language code
    getTranslation(languageCode) {
        return this._translations.find(translation => translation.language_code === languageCode);
    }
}

export default PujaStoreProductSingle;

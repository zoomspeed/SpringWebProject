/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
	config.filebrowserBrowseUrl = '/travel/resources/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/travel/resources/ckfinder/ckfinder.html?type=Images';
    config.filebrowserFlashBrowseUrl = '/travel/resources/ckfinder/ckfinder.html?type=Flash';
    config.filebrowserUploadUrl = '/travel/resources/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';
    config.filebrowserImageUploadUrl = '/travel/resources/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';
    config.filebrowserFlashUploadUrl = '/travel/resources/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';

};

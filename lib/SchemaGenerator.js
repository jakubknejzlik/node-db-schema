// Generated by CoffeeScript 1.6.3
(function() {
  var SchemaGenerator;

  SchemaGenerator = (function() {
    function SchemaGenerator() {}

    SchemaGenerator.prototype.generateSchema = function(definition) {
      throw new Error('override method generateSchema in custom generator');
    };

    SchemaGenerator.prototype.generateSchemaMigration = function(definitions, versionFrom, versionTo) {
      throw new Error('override method generateSchemaMigration in custom generator');
    };

    SchemaGenerator.prototype._tableNameForEntity = function(entity) {
      return entity.name.toLowerCase();
    };

    return SchemaGenerator;

  })();

  module.exports = SchemaGenerator;

}).call(this);

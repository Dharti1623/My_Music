// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_Entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetLoginEntitiesCollection on Isar {
  IsarCollection<LoginEntities> get loginEntities => this.collection();
}

const LoginEntitiesSchema = CollectionSchema(
  name: r'LoginEntities',
  id: 582532653392037393,
  properties: {
    r'userEmail': PropertySchema(
      id: 0,
      name: r'userEmail',
      type: IsarType.string,
    ),
    r'userToken': PropertySchema(
      id: 1,
      name: r'userToken',
      type: IsarType.string,
    )
  },
  estimateSize: _loginEntitiesEstimateSize,
  serialize: _loginEntitiesSerialize,
  deserialize: _loginEntitiesDeserialize,
  deserializeProp: _loginEntitiesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _loginEntitiesGetId,
  getLinks: _loginEntitiesGetLinks,
  attach: _loginEntitiesAttach,
  version: '3.0.5',
);

int _loginEntitiesEstimateSize(
  LoginEntities object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.userEmail.length * 3;
  bytesCount += 3 + object.userToken.length * 3;
  return bytesCount;
}

void _loginEntitiesSerialize(
  LoginEntities object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.userEmail);
  writer.writeString(offsets[1], object.userToken);
}

LoginEntities _loginEntitiesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LoginEntities();
  object.id = id;
  object.userEmail = reader.readString(offsets[0]);
  object.userToken = reader.readString(offsets[1]);
  return object;
}

P _loginEntitiesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _loginEntitiesGetId(LoginEntities object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _loginEntitiesGetLinks(LoginEntities object) {
  return [];
}

void _loginEntitiesAttach(
    IsarCollection<dynamic> col, Id id, LoginEntities object) {
  object.id = id;
}

extension LoginEntitiesQueryWhereSort
    on QueryBuilder<LoginEntities, LoginEntities, QWhere> {
  QueryBuilder<LoginEntities, LoginEntities, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LoginEntitiesQueryWhere
    on QueryBuilder<LoginEntities, LoginEntities, QWhereClause> {
  QueryBuilder<LoginEntities, LoginEntities, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LoginEntitiesQueryFilter
    on QueryBuilder<LoginEntities, LoginEntities, QFilterCondition> {
  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userEmailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userEmailGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userEmailLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userEmailBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userEmail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userEmailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userEmailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userEmailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userEmailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userEmail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userEmailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userEmailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userTokenEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userTokenGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userTokenLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userTokenBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userToken',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userTokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userTokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userTokenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userTokenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userToken',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userTokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userToken',
        value: '',
      ));
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterFilterCondition>
      userTokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userToken',
        value: '',
      ));
    });
  }
}

extension LoginEntitiesQueryObject
    on QueryBuilder<LoginEntities, LoginEntities, QFilterCondition> {}

extension LoginEntitiesQueryLinks
    on QueryBuilder<LoginEntities, LoginEntities, QFilterCondition> {}

extension LoginEntitiesQuerySortBy
    on QueryBuilder<LoginEntities, LoginEntities, QSortBy> {
  QueryBuilder<LoginEntities, LoginEntities, QAfterSortBy> sortByUserEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userEmail', Sort.asc);
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterSortBy>
      sortByUserEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userEmail', Sort.desc);
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterSortBy> sortByUserToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userToken', Sort.asc);
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterSortBy>
      sortByUserTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userToken', Sort.desc);
    });
  }
}

extension LoginEntitiesQuerySortThenBy
    on QueryBuilder<LoginEntities, LoginEntities, QSortThenBy> {
  QueryBuilder<LoginEntities, LoginEntities, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterSortBy> thenByUserEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userEmail', Sort.asc);
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterSortBy>
      thenByUserEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userEmail', Sort.desc);
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterSortBy> thenByUserToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userToken', Sort.asc);
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QAfterSortBy>
      thenByUserTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userToken', Sort.desc);
    });
  }
}

extension LoginEntitiesQueryWhereDistinct
    on QueryBuilder<LoginEntities, LoginEntities, QDistinct> {
  QueryBuilder<LoginEntities, LoginEntities, QDistinct> distinctByUserEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userEmail', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LoginEntities, LoginEntities, QDistinct> distinctByUserToken(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userToken', caseSensitive: caseSensitive);
    });
  }
}

extension LoginEntitiesQueryProperty
    on QueryBuilder<LoginEntities, LoginEntities, QQueryProperty> {
  QueryBuilder<LoginEntities, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LoginEntities, String, QQueryOperations> userEmailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userEmail');
    });
  }

  QueryBuilder<LoginEntities, String, QQueryOperations> userTokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userToken');
    });
  }
}

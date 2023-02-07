/// LDtk parser for Dart
library ldtk;

import 'dart:convert';

// To parse this JSON data, do
//
//     final ldtk = ldtkFromJson(jsonString);

///This file is a JSON schema of files created by LDtk level editor (https://ldtk.io).
///
///This is the root of any Project JSON file. It contains:  - the project settings, - an
///array of levels, - a group of definitions (that can probably be safely ignored for most
///users).
class Ldtk {
  Ldtk({
    this.forcedRefs,
    this.appBuildId,
    this.backupLimit,
    this.backupOnSave,
    this.bgColor,
    this.customCommands,
    this.defaultGridSize,
    this.defaultLevelBgColor,
    this.defaultLevelHeight,
    this.defaultLevelWidth,
    this.defaultPivotX,
    this.defaultPivotY,
    this.defs,
    this.exportLevelBg,
    this.exportPng,
    this.exportTiled,
    this.externalLevels,
    this.flags,
    this.identifierStyle,
    this.iid,
    this.imageExportMode,
    this.jsonVersion,
    this.levelNamePattern,
    this.levels,
    this.minifyJson,
    this.nextUid,
    this.pngFilePattern,
    this.simplifiedExport,
    this.toc,
    this.tutorialDesc,
    this.worldGridHeight,
    this.worldGridWidth,
    this.worldLayout,
    this.worlds,
  });

  ///This object is not actually used by LDtk. It ONLY exists to force explicit references to
  ///all types, to make sure QuickType finds them and integrate all of them. Otherwise,
  ///Quicktype will drop types that are not explicitely used.
  ForcedRefs? forcedRefs;

  ///LDtk application build identifier.<br/>  This is only used to identify the LDtk version
  ///that generated this particular project file, which can be useful for specific bug fixing.
  ///Note that the build identifier is just the date of the release, so it's not unique to
  ///each user (one single global ID per LDtk public release), and as a result, completely
  ///anonymous.
  double? appBuildId;

  ///Number of backup files to keep, if the `backupOnSave` is TRUE
  int? backupLimit;

  ///If TRUE, an extra copy of the project will be created in a sub folder, when saving.
  bool? backupOnSave;

  ///Project background color
  String? bgColor;

  ///An array of command lines that can be ran manually by the user
  List<LdtkCustomCommand>? customCommands;

  ///Default grid size for new layers
  int? defaultGridSize;

  ///Default background color of levels
  String? defaultLevelBgColor;

  ///**WARNING**: this field will move to the `worlds` array after the "multi-worlds" update.
  ///It will then be `null`. You can enable the Multi-worlds advanced project option to enable
  ///the change immediately.<br/><br/>  Default new level height
  int? defaultLevelHeight;

  ///**WARNING**: this field will move to the `worlds` array after the "multi-worlds" update.
  ///It will then be `null`. You can enable the Multi-worlds advanced project option to enable
  ///the change immediately.<br/><br/>  Default new level width
  int? defaultLevelWidth;

  ///Default X pivot (0 to 1) for new entities
  double? defaultPivotX;

  ///Default Y pivot (0 to 1) for new entities
  double? defaultPivotY;

  ///A structure containing all the definitions of this project
  Definitions? defs;

  ///If TRUE, the exported PNGs will include the level background (color or image).
  bool? exportLevelBg;

  ///**WARNING**: this deprecated value is no longer exported since version 0.9.3  Replaced
  ///by: `imageExportMode`
  bool? exportPng;

  ///If TRUE, a Tiled compatible file will also be generated along with the LDtk JSON file
  ///(default is FALSE)
  bool? exportTiled;

  ///If TRUE, one file will be saved for the project (incl. all its definitions) and one file
  ///in a sub-folder for each level.
  bool? externalLevels;

  ///An array containing various advanced flags (ie. options or other states). Possible
  ///values: `DiscardPreCsvIntGrid`, `ExportPreCsvIntGridFormat`, `IgnoreBackupSuggest`,
  ///`PrependIndexToLevelFileNames`, `MultiWorlds`, `UseMultilinesType`
  List<Flag>? flags;

  ///Naming convention for Identifiers (first-letter uppercase, full uppercase etc.) Possible
  ///values: `Capitalize`, `Uppercase`, `Lowercase`, `Free`
  IdentifierStyle? identifierStyle;

  ///Unique project identifier
  String? iid;

  ///"Image export" option when saving project. Possible values: `None`, `OneImagePerLayer`,
  ///`OneImagePerLevel`, `LayersAndLevels`
  ImageExportMode? imageExportMode;

  ///File format version
  String? jsonVersion;

  ///The default naming convention for level identifiers.
  String? levelNamePattern;

  ///All levels. The order of this array is only relevant in `LinearHorizontal` and
  ///`linearVertical` world layouts (see `worldLayout` value).<br/>  Otherwise, you should
  ///refer to the `worldX`,`worldY` coordinates of each Level.
  List<Level>? levels;

  ///If TRUE, the Json is partially minified (no indentation, nor line breaks, default is
  ///FALSE)
  bool? minifyJson;

  ///Next Unique integer ID available
  int? nextUid;

  ///File naming pattern for exported PNGs
  String? pngFilePattern;

  ///If TRUE, a very simplified will be generated on saving, for quicker & easier engine
  ///integration.
  bool? simplifiedExport;

  ///All instances of entities that have their `exportToToc` flag enabled are listed in this
  ///array.
  List<LdtkTableOfContentEntry>? toc;

  ///This optional description is used by LDtk Samples to show up some informations and
  ///instructions.
  String? tutorialDesc;

  ///**WARNING**: this field will move to the `worlds` array after the "multi-worlds" update.
  ///It will then be `null`. You can enable the Multi-worlds advanced project option to enable
  ///the change immediately.<br/><br/>  Height of the world grid in pixels.
  int? worldGridHeight;

  ///**WARNING**: this field will move to the `worlds` array after the "multi-worlds" update.
  ///It will then be `null`. You can enable the Multi-worlds advanced project option to enable
  ///the change immediately.<br/><br/>  Width of the world grid in pixels.
  int? worldGridWidth;

  ///**WARNING**: this field will move to the `worlds` array after the "multi-worlds" update.
  ///It will then be `null`. You can enable the Multi-worlds advanced project option to enable
  ///the change immediately.<br/><br/>  An enum that describes how levels are organized in
  ///this project (ie. linearly or in a 2D space). Possible values: &lt;`null`&gt;, `Free`,
  ///`GridVania`, `LinearHorizontal`, `LinearVertical`
  WorldLayout? worldLayout;

  ///This array is not used yet in current LDtk version (so, for now, it's always
  ///empty).<br/><br/>In a later update, it will be possible to have multiple Worlds in a
  ///single project, each containing multiple Levels.<br/><br/>What will change when "Multiple
  ///worlds" support will be added to LDtk:<br/><br/> - in current version, a LDtk project
  ///file can only contain a single world with multiple levels in it. In this case, levels and
  ///world layout related settings are stored in the root of the JSON.<br/> - after the
  ///"Multiple worlds" update, there will be a `worlds` array in root, each world containing
  ///levels and layout settings. Basically, it's pretty much only about moving the `levels`
  ///array to the `worlds` array, along with world layout related values (eg. `worldGridWidth`
  ///etc).<br/><br/>If you want to start supporting this future update easily, please refer to
  ///this documentation: https://github.com/deepnight/ldtk/issues/231
  List<World>? worlds;

  factory Ldtk.fromRawJson(String str) => Ldtk.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ldtk.fromJson(Map<String, dynamic> json) => Ldtk(
        forcedRefs: json["__FORCED_REFS"] == null
            ? null
            : ForcedRefs.fromJson(json["__FORCED_REFS"]),
        appBuildId: json["appBuildId"]?.toDouble(),
        backupLimit: json["backupLimit"],
        backupOnSave: json["backupOnSave"],
        bgColor: json["bgColor"],
        customCommands: json["customCommands"] == null
            ? []
            : List<LdtkCustomCommand>.from(json["customCommands"]!
                .map((x) => LdtkCustomCommand.fromJson(x))),
        defaultGridSize: json["defaultGridSize"],
        defaultLevelBgColor: json["defaultLevelBgColor"],
        defaultLevelHeight: json["defaultLevelHeight"],
        defaultLevelWidth: json["defaultLevelWidth"],
        defaultPivotX: json["defaultPivotX"]?.toDouble(),
        defaultPivotY: json["defaultPivotY"]?.toDouble(),
        defs: json["defs"] == null ? null : Definitions.fromJson(json["defs"]),
        exportLevelBg: json["exportLevelBg"],
        exportPng: json["exportPng"],
        exportTiled: json["exportTiled"],
        externalLevels: json["externalLevels"],
        flags: json["flags"] == null
            ? []
            : List<Flag>.from(json["flags"]!.map((x) => flagValues.map[x]!)),
        identifierStyle: identifierStyleValues.map[json["identifierStyle"]],
        iid: json["iid"],
        imageExportMode: imageExportModeValues.map[json["imageExportMode"]],
        jsonVersion: json["jsonVersion"],
        levelNamePattern: json["levelNamePattern"],
        levels: json["levels"] == null
            ? []
            : List<Level>.from(json["levels"]!.map((x) => Level.fromJson(x))),
        minifyJson: json["minifyJson"],
        nextUid: json["nextUid"],
        pngFilePattern: json["pngFilePattern"],
        simplifiedExport: json["simplifiedExport"],
        toc: json["toc"] == null
            ? []
            : List<LdtkTableOfContentEntry>.from(
                json["toc"]!.map((x) => LdtkTableOfContentEntry.fromJson(x))),
        tutorialDesc: json["tutorialDesc"],
        worldGridHeight: json["worldGridHeight"],
        worldGridWidth: json["worldGridWidth"],
        worldLayout: worldLayoutValues.map[json["worldLayout"]],
        worlds: json["worlds"] == null
            ? []
            : List<World>.from(json["worlds"]!.map((x) => World.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "__FORCED_REFS": forcedRefs?.toJson(),
        "appBuildId": appBuildId,
        "backupLimit": backupLimit,
        "backupOnSave": backupOnSave,
        "bgColor": bgColor,
        "customCommands": customCommands == null
            ? []
            : List<dynamic>.from(customCommands!.map((x) => x.toJson())),
        "defaultGridSize": defaultGridSize,
        "defaultLevelBgColor": defaultLevelBgColor,
        "defaultLevelHeight": defaultLevelHeight,
        "defaultLevelWidth": defaultLevelWidth,
        "defaultPivotX": defaultPivotX,
        "defaultPivotY": defaultPivotY,
        "defs": defs?.toJson(),
        "exportLevelBg": exportLevelBg,
        "exportPng": exportPng,
        "exportTiled": exportTiled,
        "externalLevels": externalLevels,
        "flags": flags == null
            ? []
            : List<dynamic>.from(flags!.map((x) => flagValues.reverse[x])),
        "identifierStyle": identifierStyleValues.reverse[identifierStyle],
        "iid": iid,
        "imageExportMode": imageExportModeValues.reverse[imageExportMode],
        "jsonVersion": jsonVersion,
        "levelNamePattern": levelNamePattern,
        "levels": levels == null
            ? []
            : List<dynamic>.from(levels!.map((x) => x.toJson())),
        "minifyJson": minifyJson,
        "nextUid": nextUid,
        "pngFilePattern": pngFilePattern,
        "simplifiedExport": simplifiedExport,
        "toc":
            toc == null ? [] : List<dynamic>.from(toc!.map((x) => x.toJson())),
        "tutorialDesc": tutorialDesc,
        "worldGridHeight": worldGridHeight,
        "worldGridWidth": worldGridWidth,
        "worldLayout": worldLayoutValues.reverse[worldLayout],
        "worlds": worlds == null
            ? []
            : List<dynamic>.from(worlds!.map((x) => x.toJson())),
      };
}

class LdtkCustomCommand {
  LdtkCustomCommand({
    this.command,
    this.when,
  });

  String? command;

  ///Possible values: `Manual`, `AfterLoad`, `BeforeSave`, `AfterSave`
  When? when;

  factory LdtkCustomCommand.fromRawJson(String str) =>
      LdtkCustomCommand.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LdtkCustomCommand.fromJson(Map<String, dynamic> json) =>
      LdtkCustomCommand(
        command: json["command"],
        when: whenValues.map[json["when"]],
      );

  Map<String, dynamic> toJson() => {
        "command": command,
        "when": whenValues.reverse[when],
      };
}

///Possible values: `Manual`, `AfterLoad`, `BeforeSave`, `AfterSave`
enum When { MANUAL, AFTER_LOAD, BEFORE_SAVE, AFTER_SAVE }

final whenValues = EnumValues({
  "AfterLoad": When.AFTER_LOAD,
  "AfterSave": When.AFTER_SAVE,
  "BeforeSave": When.BEFORE_SAVE,
  "Manual": When.MANUAL
});

///If you're writing your own LDtk importer, you should probably just ignore *most* stuff in
///the `defs` section, as it contains data that are mostly important to the editor. To keep
///you away from the `defs` section and avoid some unnecessary JSON parsing, important data
///from definitions is often duplicated in fields prefixed with a double underscore (eg.
///`__identifier` or `__type`).  The 2 only definition types you might need here are
///**Tilesets** and **Enums**.
///
///A structure containing all the definitions of this project
class Definitions {
  Definitions({
    this.entities,
    this.enums,
    this.externalEnums,
    this.layers,
    this.levelFields,
    this.tilesets,
  });

  ///All entities definitions, including their custom fields
  List<EntityDefinition>? entities;

  ///All internal enums
  List<EnumDefinition>? enums;

  ///Note: external enums are exactly the same as `enums`, except they have a `relPath` to
  ///point to an external source file.
  List<EnumDefinition>? externalEnums;

  ///All layer definitions
  List<LayerDefinition>? layers;

  ///All custom fields available to all levels.
  List<FieldDefinition>? levelFields;

  ///All tilesets
  List<TilesetDefinition>? tilesets;

  factory Definitions.fromRawJson(String str) =>
      Definitions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Definitions.fromJson(Map<String, dynamic> json) => Definitions(
        entities: json["entities"] == null
            ? []
            : List<EntityDefinition>.from(
                json["entities"]!.map((x) => EntityDefinition.fromJson(x))),
        enums: json["enums"] == null
            ? []
            : List<EnumDefinition>.from(
                json["enums"]!.map((x) => EnumDefinition.fromJson(x))),
        externalEnums: json["externalEnums"] == null
            ? []
            : List<EnumDefinition>.from(
                json["externalEnums"]!.map((x) => EnumDefinition.fromJson(x))),
        layers: json["layers"] == null
            ? []
            : List<LayerDefinition>.from(
                json["layers"]!.map((x) => LayerDefinition.fromJson(x))),
        levelFields: json["levelFields"] == null
            ? []
            : List<FieldDefinition>.from(
                json["levelFields"]!.map((x) => FieldDefinition.fromJson(x))),
        tilesets: json["tilesets"] == null
            ? []
            : List<TilesetDefinition>.from(
                json["tilesets"]!.map((x) => TilesetDefinition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "entities": entities == null
            ? []
            : List<dynamic>.from(entities!.map((x) => x.toJson())),
        "enums": enums == null
            ? []
            : List<dynamic>.from(enums!.map((x) => x.toJson())),
        "externalEnums": externalEnums == null
            ? []
            : List<dynamic>.from(externalEnums!.map((x) => x.toJson())),
        "layers": layers == null
            ? []
            : List<dynamic>.from(layers!.map((x) => x.toJson())),
        "levelFields": levelFields == null
            ? []
            : List<dynamic>.from(levelFields!.map((x) => x.toJson())),
        "tilesets": tilesets == null
            ? []
            : List<dynamic>.from(tilesets!.map((x) => x.toJson())),
      };
}

class EntityDefinition {
  EntityDefinition({
    this.color,
    this.doc,
    this.exportToToc,
    this.fieldDefs,
    this.fillOpacity,
    this.height,
    this.hollow,
    this.identifier,
    this.keepAspectRatio,
    this.limitBehavior,
    this.limitScope,
    this.lineOpacity,
    this.maxCount,
    this.nineSliceBorders,
    this.pivotX,
    this.pivotY,
    this.renderMode,
    this.resizableX,
    this.resizableY,
    this.showName,
    this.tags,
    this.tileId,
    this.tileOpacity,
    this.tileRect,
    this.tileRenderMode,
    this.tilesetId,
    this.uid,
    this.width,
  });

  ///Base entity color
  String? color;

  ///User defined documentation for this element to provide help/tips to level designers.
  String? doc;

  ///If enabled, all instances of this entity will be listed in the project "Table of content"
  ///object.
  bool? exportToToc;

  ///Array of field definitions
  List<FieldDefinition>? fieldDefs;
  double? fillOpacity;

  ///Pixel height
  int? height;
  bool? hollow;

  ///User defined unique identifier
  String? identifier;

  ///Only applies to entities resizable on both X/Y. If TRUE, the entity instance width/height
  ///will keep the same aspect ratio as the definition.
  bool? keepAspectRatio;

  ///Possible values: `DiscardOldOnes`, `PreventAdding`, `MoveLastOne`
  LimitBehavior? limitBehavior;

  ///If TRUE, the maxCount is a "per world" limit, if FALSE, it's a "per level". Possible
  ///values: `PerLayer`, `PerLevel`, `PerWorld`
  LimitScope? limitScope;
  double? lineOpacity;

  ///Max instances count
  int? maxCount;

  ///An array of 4 dimensions for the up/right/down/left borders (in this order) when using
  ///9-slice mode for `tileRenderMode`.<br/>  If the tileRenderMode is not NineSlice, then
  ///this array is empty.<br/>  See: https://en.wikipedia.org/wiki/9-slice_scaling
  List<int>? nineSliceBorders;

  ///Pivot X coordinate (from 0 to 1.0)
  double? pivotX;

  ///Pivot Y coordinate (from 0 to 1.0)
  double? pivotY;

  ///Possible values: `Rectangle`, `Ellipse`, `Tile`, `Cross`
  RenderMode? renderMode;

  ///If TRUE, the entity instances will be resizable horizontally
  bool? resizableX;

  ///If TRUE, the entity instances will be resizable vertically
  bool? resizableY;

  ///Display entity name in editor
  bool? showName;

  ///An array of strings that classifies this entity
  List<String>? tags;

  ///**WARNING**: this deprecated value is no longer exported since version 1.2.0  Replaced
  ///by: `tileRect`
  int? tileId;
  double? tileOpacity;

  ///An object representing a rectangle from an existing Tileset
  TilesetRectangle? tileRect;

  ///An enum describing how the the Entity tile is rendered inside the Entity bounds. Possible
  ///values: `Cover`, `FitInside`, `Repeat`, `Stretch`, `FullSizeCropped`,
  ///`FullSizeUncropped`, `NineSlice`
  TileRenderMode? tileRenderMode;

  ///Tileset ID used for optional tile display
  int? tilesetId;

  ///Unique Int identifier
  int? uid;

  ///Pixel width
  int? width;

  factory EntityDefinition.fromRawJson(String str) =>
      EntityDefinition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EntityDefinition.fromJson(Map<String, dynamic> json) =>
      EntityDefinition(
        color: json["color"],
        doc: json["doc"],
        exportToToc: json["exportToToc"],
        fieldDefs: json["fieldDefs"] == null
            ? []
            : List<FieldDefinition>.from(
                json["fieldDefs"]!.map((x) => FieldDefinition.fromJson(x))),
        fillOpacity: json["fillOpacity"]?.toDouble(),
        height: json["height"],
        hollow: json["hollow"],
        identifier: json["identifier"],
        keepAspectRatio: json["keepAspectRatio"],
        limitBehavior: limitBehaviorValues.map[json["limitBehavior"]],
        limitScope: limitScopeValues.map[json["limitScope"]],
        lineOpacity: json["lineOpacity"]?.toDouble(),
        maxCount: json["maxCount"],
        nineSliceBorders: json["nineSliceBorders"] == null
            ? []
            : List<int>.from(json["nineSliceBorders"]!.map((x) => x)),
        pivotX: json["pivotX"]?.toDouble(),
        pivotY: json["pivotY"]?.toDouble(),
        renderMode: renderModeValues.map[json["renderMode"]],
        resizableX: json["resizableX"],
        resizableY: json["resizableY"],
        showName: json["showName"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        tileId: json["tileId"],
        tileOpacity: json["tileOpacity"]?.toDouble(),
        tileRect: json["tileRect"] == null
            ? null
            : TilesetRectangle.fromJson(json["tileRect"]),
        tileRenderMode: tileRenderModeValues.map[json["tileRenderMode"]],
        tilesetId: json["tilesetId"],
        uid: json["uid"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "doc": doc,
        "exportToToc": exportToToc,
        "fieldDefs": fieldDefs == null
            ? []
            : List<dynamic>.from(fieldDefs!.map((x) => x.toJson())),
        "fillOpacity": fillOpacity,
        "height": height,
        "hollow": hollow,
        "identifier": identifier,
        "keepAspectRatio": keepAspectRatio,
        "limitBehavior": limitBehaviorValues.reverse[limitBehavior],
        "limitScope": limitScopeValues.reverse[limitScope],
        "lineOpacity": lineOpacity,
        "maxCount": maxCount,
        "nineSliceBorders": nineSliceBorders == null
            ? []
            : List<dynamic>.from(nineSliceBorders!.map((x) => x)),
        "pivotX": pivotX,
        "pivotY": pivotY,
        "renderMode": renderModeValues.reverse[renderMode],
        "resizableX": resizableX,
        "resizableY": resizableY,
        "showName": showName,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "tileId": tileId,
        "tileOpacity": tileOpacity,
        "tileRect": tileRect?.toJson(),
        "tileRenderMode": tileRenderModeValues.reverse[tileRenderMode],
        "tilesetId": tilesetId,
        "uid": uid,
        "width": width,
      };
}

///This section is mostly only intended for the LDtk editor app itself. You can safely
///ignore it.
class FieldDefinition {
  FieldDefinition({
    this.type,
    this.acceptFileTypes,
    this.allowedRefs,
    this.allowedRefTags,
    this.allowOutOfLevelRef,
    this.arrayMaxLength,
    this.arrayMinLength,
    this.autoChainRef,
    this.canBeNull,
    this.defaultOverride,
    this.doc,
    this.editorAlwaysShow,
    this.editorCutLongValues,
    this.editorDisplayMode,
    this.editorDisplayPos,
    this.editorLinkStyle,
    this.editorShowInWorld,
    this.editorTextPrefix,
    this.editorTextSuffix,
    this.identifier,
    this.isArray,
    this.max,
    this.min,
    this.regex,
    this.symmetricalRef,
    this.textLanguageMode,
    this.tilesetUid,
    this.fieldDefinitionType,
    this.uid,
    this.useForSmartColor,
  });

  ///Human readable value type. Possible values: `Int, Float, String, Bool, Color,
  ///ExternEnum.XXX, LocalEnum.XXX, Point, FilePath`.<br/>  If the field is an array, this
  ///field will look like `Array<...>` (eg. `Array<Int>`, `Array<Point>` etc.)<br/>  NOTE: if
  ///you enable the advanced option **Use Multilines type**, you will have "*Multilines*"
  ///instead of "*String*" when relevant.
  String? type;

  ///Optional list of accepted file extensions for FilePath value type. Includes the dot:
  ///`.ext`
  List<String>? acceptFileTypes;

  ///Possible values: `Any`, `OnlySame`, `OnlyTags`
  AllowedRefs? allowedRefs;
  List<String>? allowedRefTags;
  bool? allowOutOfLevelRef;

  ///Array max length
  int? arrayMaxLength;

  ///Array min length
  int? arrayMinLength;
  bool? autoChainRef;

  ///TRUE if the value can be null. For arrays, TRUE means it can contain null values
  ///(exception: array of Points can't have null values).
  bool? canBeNull;

  ///Default value if selected value is null or invalid.
  dynamic defaultOverride;

  ///User defined documentation for this field to provide help/tips to level designers about
  ///accepted values.
  String? doc;
  bool? editorAlwaysShow;
  bool? editorCutLongValues;

  ///Possible values: `Hidden`, `ValueOnly`, `NameAndValue`, `EntityTile`, `Points`,
  ///`PointStar`, `PointPath`, `PointPathLoop`, `RadiusPx`, `RadiusGrid`,
  ///`ArrayCountWithLabel`, `ArrayCountNoLabel`, `RefLinkBetweenPivots`,
  ///`RefLinkBetweenCenters`
  EditorDisplayMode? editorDisplayMode;

  ///Possible values: `Above`, `Center`, `Beneath`
  EditorDisplayPos? editorDisplayPos;

  ///Possible values: `ZigZag`, `StraightArrow`, `CurvedArrow`, `ArrowsLine`, `DashedLine`
  EditorLinkStyle? editorLinkStyle;
  bool? editorShowInWorld;
  String? editorTextPrefix;
  String? editorTextSuffix;

  ///User defined unique identifier
  String? identifier;

  ///TRUE if the value is an array of multiple values
  bool? isArray;

  ///Max limit for value, if applicable
  double? max;

  ///Min limit for value, if applicable
  double? min;

  ///Optional regular expression that needs to be matched to accept values. Expected format:
  ///`/some_reg_ex/g`, with optional "i" flag.
  String? regex;
  bool? symmetricalRef;

  ///Possible values: &lt;`null`&gt;, `LangPython`, `LangRuby`, `LangJS`, `LangLua`, `LangC`,
  ///`LangHaxe`, `LangMarkdown`, `LangJson`, `LangXml`, `LangLog`
  TextLanguageMode? textLanguageMode;

  ///UID of the tileset used for a Tile
  int? tilesetUid;

  ///Internal enum representing the possible field types. Possible values: F_Int, F_Float,
  ///F_String, F_Text, F_Bool, F_Color, F_Enum(...), F_Point, F_Path, F_EntityRef, F_Tile
  String? fieldDefinitionType;

  ///Unique Int identifier
  int? uid;

  ///If TRUE, the color associated with this field will override the Entity or Level default
  ///color in the editor UI. For Enum fields, this would be the color associated to their
  ///values.
  bool? useForSmartColor;

  factory FieldDefinition.fromRawJson(String str) =>
      FieldDefinition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FieldDefinition.fromJson(Map<String, dynamic> json) =>
      FieldDefinition(
        type: json["__type"],
        acceptFileTypes: json["acceptFileTypes"] == null
            ? []
            : List<String>.from(json["acceptFileTypes"]!.map((x) => x)),
        allowedRefs: allowedRefsValues.map[json["allowedRefs"]],
        allowedRefTags: json["allowedRefTags"] == null
            ? []
            : List<String>.from(json["allowedRefTags"]!.map((x) => x)),
        allowOutOfLevelRef: json["allowOutOfLevelRef"],
        arrayMaxLength: json["arrayMaxLength"],
        arrayMinLength: json["arrayMinLength"],
        autoChainRef: json["autoChainRef"],
        canBeNull: json["canBeNull"],
        defaultOverride: json["defaultOverride"],
        doc: json["doc"],
        editorAlwaysShow: json["editorAlwaysShow"],
        editorCutLongValues: json["editorCutLongValues"],
        editorDisplayMode:
            editorDisplayModeValues.map[json["editorDisplayMode"]],
        editorDisplayPos: editorDisplayPosValues.map[json["editorDisplayPos"]],
        editorLinkStyle: editorLinkStyleValues.map[json["editorLinkStyle"]],
        editorShowInWorld: json["editorShowInWorld"],
        editorTextPrefix: json["editorTextPrefix"],
        editorTextSuffix: json["editorTextSuffix"],
        identifier: json["identifier"],
        isArray: json["isArray"],
        max: json["max"]?.toDouble(),
        min: json["min"]?.toDouble(),
        regex: json["regex"],
        symmetricalRef: json["symmetricalRef"],
        textLanguageMode: textLanguageModeValues.map[json["textLanguageMode"]],
        tilesetUid: json["tilesetUid"],
        fieldDefinitionType: json["type"],
        uid: json["uid"],
        useForSmartColor: json["useForSmartColor"],
      );

  Map<String, dynamic> toJson() => {
        "__type": type,
        "acceptFileTypes": acceptFileTypes == null
            ? []
            : List<dynamic>.from(acceptFileTypes!.map((x) => x)),
        "allowedRefs": allowedRefsValues.reverse[allowedRefs],
        "allowedRefTags": allowedRefTags == null
            ? []
            : List<dynamic>.from(allowedRefTags!.map((x) => x)),
        "allowOutOfLevelRef": allowOutOfLevelRef,
        "arrayMaxLength": arrayMaxLength,
        "arrayMinLength": arrayMinLength,
        "autoChainRef": autoChainRef,
        "canBeNull": canBeNull,
        "defaultOverride": defaultOverride,
        "doc": doc,
        "editorAlwaysShow": editorAlwaysShow,
        "editorCutLongValues": editorCutLongValues,
        "editorDisplayMode": editorDisplayModeValues.reverse[editorDisplayMode],
        "editorDisplayPos": editorDisplayPosValues.reverse[editorDisplayPos],
        "editorLinkStyle": editorLinkStyleValues.reverse[editorLinkStyle],
        "editorShowInWorld": editorShowInWorld,
        "editorTextPrefix": editorTextPrefix,
        "editorTextSuffix": editorTextSuffix,
        "identifier": identifier,
        "isArray": isArray,
        "max": max,
        "min": min,
        "regex": regex,
        "symmetricalRef": symmetricalRef,
        "textLanguageMode": textLanguageModeValues.reverse[textLanguageMode],
        "tilesetUid": tilesetUid,
        "type": fieldDefinitionType,
        "uid": uid,
        "useForSmartColor": useForSmartColor,
      };
}

///Possible values: `Any`, `OnlySame`, `OnlyTags`
enum AllowedRefs { ANY, ONLY_SAME, ONLY_TAGS }

final allowedRefsValues = EnumValues({
  "Any": AllowedRefs.ANY,
  "OnlySame": AllowedRefs.ONLY_SAME,
  "OnlyTags": AllowedRefs.ONLY_TAGS
});

///Possible values: `Hidden`, `ValueOnly`, `NameAndValue`, `EntityTile`, `Points`,
///`PointStar`, `PointPath`, `PointPathLoop`, `RadiusPx`, `RadiusGrid`,
///`ArrayCountWithLabel`, `ArrayCountNoLabel`, `RefLinkBetweenPivots`,
///`RefLinkBetweenCenters`
enum EditorDisplayMode {
  HIDDEN,
  VALUE_ONLY,
  NAME_AND_VALUE,
  ENTITY_TILE,
  POINTS,
  POINT_STAR,
  POINT_PATH,
  POINT_PATH_LOOP,
  RADIUS_PX,
  RADIUS_GRID,
  ARRAY_COUNT_WITH_LABEL,
  ARRAY_COUNT_NO_LABEL,
  REF_LINK_BETWEEN_PIVOTS,
  REF_LINK_BETWEEN_CENTERS
}

final editorDisplayModeValues = EnumValues({
  "ArrayCountNoLabel": EditorDisplayMode.ARRAY_COUNT_NO_LABEL,
  "ArrayCountWithLabel": EditorDisplayMode.ARRAY_COUNT_WITH_LABEL,
  "EntityTile": EditorDisplayMode.ENTITY_TILE,
  "Hidden": EditorDisplayMode.HIDDEN,
  "NameAndValue": EditorDisplayMode.NAME_AND_VALUE,
  "Points": EditorDisplayMode.POINTS,
  "PointPath": EditorDisplayMode.POINT_PATH,
  "PointPathLoop": EditorDisplayMode.POINT_PATH_LOOP,
  "PointStar": EditorDisplayMode.POINT_STAR,
  "RadiusGrid": EditorDisplayMode.RADIUS_GRID,
  "RadiusPx": EditorDisplayMode.RADIUS_PX,
  "RefLinkBetweenCenters": EditorDisplayMode.REF_LINK_BETWEEN_CENTERS,
  "RefLinkBetweenPivots": EditorDisplayMode.REF_LINK_BETWEEN_PIVOTS,
  "ValueOnly": EditorDisplayMode.VALUE_ONLY
});

///Possible values: `Above`, `Center`, `Beneath`
enum EditorDisplayPos { ABOVE, CENTER, BENEATH }

final editorDisplayPosValues = EnumValues({
  "Above": EditorDisplayPos.ABOVE,
  "Beneath": EditorDisplayPos.BENEATH,
  "Center": EditorDisplayPos.CENTER
});

///Possible values: `ZigZag`, `StraightArrow`, `CurvedArrow`, `ArrowsLine`, `DashedLine`
enum EditorLinkStyle {
  ZIG_ZAG,
  STRAIGHT_ARROW,
  CURVED_ARROW,
  ARROWS_LINE,
  DASHED_LINE
}

final editorLinkStyleValues = EnumValues({
  "ArrowsLine": EditorLinkStyle.ARROWS_LINE,
  "CurvedArrow": EditorLinkStyle.CURVED_ARROW,
  "DashedLine": EditorLinkStyle.DASHED_LINE,
  "StraightArrow": EditorLinkStyle.STRAIGHT_ARROW,
  "ZigZag": EditorLinkStyle.ZIG_ZAG
});

enum TextLanguageMode {
  LANG_PYTHON,
  LANG_RUBY,
  LANG_JS,
  LANG_LUA,
  LANG_C,
  LANG_HAXE,
  LANG_MARKDOWN,
  LANG_JSON,
  LANG_XML,
  LANG_LOG
}

final textLanguageModeValues = EnumValues({
  "LangC": TextLanguageMode.LANG_C,
  "LangHaxe": TextLanguageMode.LANG_HAXE,
  "LangJS": TextLanguageMode.LANG_JS,
  "LangJson": TextLanguageMode.LANG_JSON,
  "LangLog": TextLanguageMode.LANG_LOG,
  "LangLua": TextLanguageMode.LANG_LUA,
  "LangMarkdown": TextLanguageMode.LANG_MARKDOWN,
  "LangPython": TextLanguageMode.LANG_PYTHON,
  "LangRuby": TextLanguageMode.LANG_RUBY,
  "LangXml": TextLanguageMode.LANG_XML
});

///Possible values: `DiscardOldOnes`, `PreventAdding`, `MoveLastOne`
enum LimitBehavior { DISCARD_OLD_ONES, PREVENT_ADDING, MOVE_LAST_ONE }

final limitBehaviorValues = EnumValues({
  "DiscardOldOnes": LimitBehavior.DISCARD_OLD_ONES,
  "MoveLastOne": LimitBehavior.MOVE_LAST_ONE,
  "PreventAdding": LimitBehavior.PREVENT_ADDING
});

///If TRUE, the maxCount is a "per world" limit, if FALSE, it's a "per level". Possible
///values: `PerLayer`, `PerLevel`, `PerWorld`
enum LimitScope { PER_LAYER, PER_LEVEL, PER_WORLD }

final limitScopeValues = EnumValues({
  "PerLayer": LimitScope.PER_LAYER,
  "PerLevel": LimitScope.PER_LEVEL,
  "PerWorld": LimitScope.PER_WORLD
});

///Possible values: `Rectangle`, `Ellipse`, `Tile`, `Cross`
enum RenderMode { RECTANGLE, ELLIPSE, TILE, CROSS }

final renderModeValues = EnumValues({
  "Cross": RenderMode.CROSS,
  "Ellipse": RenderMode.ELLIPSE,
  "Rectangle": RenderMode.RECTANGLE,
  "Tile": RenderMode.TILE
});

///This object represents a custom sub rectangle in a Tileset image.
class TilesetRectangle {
  TilesetRectangle({
    this.h,
    this.tilesetUid,
    this.w,
    this.x,
    this.y,
  });

  ///Height in pixels
  int? h;

  ///UID of the tileset
  int? tilesetUid;

  ///Width in pixels
  int? w;

  ///X pixels coordinate of the top-left corner in the Tileset image
  int? x;

  ///Y pixels coordinate of the top-left corner in the Tileset image
  int? y;

  factory TilesetRectangle.fromRawJson(String str) =>
      TilesetRectangle.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TilesetRectangle.fromJson(Map<String, dynamic> json) =>
      TilesetRectangle(
        h: json["h"],
        tilesetUid: json["tilesetUid"],
        w: json["w"],
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "h": h,
        "tilesetUid": tilesetUid,
        "w": w,
        "x": x,
        "y": y,
      };
}

///An enum describing how the the Entity tile is rendered inside the Entity bounds. Possible
///values: `Cover`, `FitInside`, `Repeat`, `Stretch`, `FullSizeCropped`,
///`FullSizeUncropped`, `NineSlice`
enum TileRenderMode {
  COVER,
  FIT_INSIDE,
  REPEAT,
  STRETCH,
  FULL_SIZE_CROPPED,
  FULL_SIZE_UNCROPPED,
  NINE_SLICE
}

final tileRenderModeValues = EnumValues({
  "Cover": TileRenderMode.COVER,
  "FitInside": TileRenderMode.FIT_INSIDE,
  "FullSizeCropped": TileRenderMode.FULL_SIZE_CROPPED,
  "FullSizeUncropped": TileRenderMode.FULL_SIZE_UNCROPPED,
  "NineSlice": TileRenderMode.NINE_SLICE,
  "Repeat": TileRenderMode.REPEAT,
  "Stretch": TileRenderMode.STRETCH
});

class EnumDefinition {
  EnumDefinition({
    this.externalFileChecksum,
    this.externalRelPath,
    this.iconTilesetUid,
    this.identifier,
    this.tags,
    this.uid,
    this.values,
  });

  String? externalFileChecksum;

  ///Relative path to the external file providing this Enum
  String? externalRelPath;

  ///Tileset UID if provided
  int? iconTilesetUid;

  ///User defined unique identifier
  String? identifier;

  ///An array of user-defined tags to organize the Enums
  List<String>? tags;

  ///Unique Int identifier
  int? uid;

  ///All possible enum values, with their optional Tile infos.
  List<EnumValueDefinition>? values;

  factory EnumDefinition.fromRawJson(String str) =>
      EnumDefinition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EnumDefinition.fromJson(Map<String, dynamic> json) => EnumDefinition(
        externalFileChecksum: json["externalFileChecksum"],
        externalRelPath: json["externalRelPath"],
        iconTilesetUid: json["iconTilesetUid"],
        identifier: json["identifier"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        uid: json["uid"],
        values: json["values"] == null
            ? []
            : List<EnumValueDefinition>.from(
                json["values"]!.map((x) => EnumValueDefinition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "externalFileChecksum": externalFileChecksum,
        "externalRelPath": externalRelPath,
        "iconTilesetUid": iconTilesetUid,
        "identifier": identifier,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "uid": uid,
        "values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x.toJson())),
      };
}

class EnumValueDefinition {
  EnumValueDefinition({
    this.tileSrcRect,
    this.color,
    this.id,
    this.tileId,
  });

  ///An array of 4 Int values that refers to the tile in the tileset image: `[ x, y, width,
  ///height ]`
  List<int>? tileSrcRect;

  ///Optional color
  int? color;

  ///Enum value
  String? id;

  ///The optional ID of the tile
  int? tileId;

  factory EnumValueDefinition.fromRawJson(String str) =>
      EnumValueDefinition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EnumValueDefinition.fromJson(Map<String, dynamic> json) =>
      EnumValueDefinition(
        tileSrcRect: json["__tileSrcRect"] == null
            ? []
            : List<int>.from(json["__tileSrcRect"]!.map((x) => x)),
        color: json["color"],
        id: json["id"],
        tileId: json["tileId"],
      );

  Map<String, dynamic> toJson() => {
        "__tileSrcRect": tileSrcRect == null
            ? []
            : List<dynamic>.from(tileSrcRect!.map((x) => x)),
        "color": color,
        "id": id,
        "tileId": tileId,
      };
}

class LayerDefinition {
  LayerDefinition({
    this.type,
    this.autoRuleGroups,
    this.autoSourceLayerDefUid,
    this.autoTilesetDefUid,
    this.canSelectWhenInactive,
    this.displayOpacity,
    this.doc,
    this.excludedTags,
    this.gridSize,
    this.guideGridHei,
    this.guideGridWid,
    this.hideFieldsWhenInactive,
    this.hideInList,
    this.identifier,
    this.inactiveOpacity,
    this.intGridValues,
    this.parallaxFactorX,
    this.parallaxFactorY,
    this.parallaxScaling,
    this.pxOffsetX,
    this.pxOffsetY,
    this.requiredTags,
    this.tilePivotX,
    this.tilePivotY,
    this.tilesetDefUid,
    this.layerDefinitionType,
    this.uid,
  });

  ///Type of the layer (*IntGrid, Entities, Tiles or AutoLayer*)
  String? type;

  ///Contains all the auto-layer rule definitions.
  List<AutoLayerRuleGroup>? autoRuleGroups;
  int? autoSourceLayerDefUid;

  ///**WARNING**: this deprecated value is no longer exported since version 1.2.0  Replaced
  ///by: `tilesetDefUid`
  int? autoTilesetDefUid;

  ///Allow editor selections when the layer is not currently active.
  bool? canSelectWhenInactive;

  ///Opacity of the layer (0 to 1.0)
  double? displayOpacity;

  ///User defined documentation for this element to provide help/tips to level designers.
  String? doc;

  ///An array of tags to forbid some Entities in this layer
  List<String>? excludedTags;

  ///Width and height of the grid in pixels
  int? gridSize;

  ///Height of the optional "guide" grid in pixels
  int? guideGridHei;

  ///Width of the optional "guide" grid in pixels
  int? guideGridWid;
  bool? hideFieldsWhenInactive;

  ///Hide the layer from the list on the side of the editor view.
  bool? hideInList;

  ///User defined unique identifier
  String? identifier;

  ///Alpha of this layer when it is not the active one.
  double? inactiveOpacity;

  ///An array that defines extra optional info for each IntGrid value.<br/>  WARNING: the
  ///array order is not related to actual IntGrid values! As user can re-order IntGrid values
  ///freely, you may value "2" before value "1" in this array.
  List<IntGridValueDefinition>? intGridValues;

  ///Parallax horizontal factor (from -1 to 1, defaults to 0) which affects the scrolling
  ///speed of this layer, creating a fake 3D (parallax) effect.
  double? parallaxFactorX;

  ///Parallax vertical factor (from -1 to 1, defaults to 0) which affects the scrolling speed
  ///of this layer, creating a fake 3D (parallax) effect.
  double? parallaxFactorY;

  ///If true (default), a layer with a parallax factor will also be scaled up/down accordingly.
  bool? parallaxScaling;

  ///X offset of the layer, in pixels (IMPORTANT: this should be added to the `LayerInstance`
  ///optional offset)
  int? pxOffsetX;

  ///Y offset of the layer, in pixels (IMPORTANT: this should be added to the `LayerInstance`
  ///optional offset)
  int? pxOffsetY;

  ///An array of tags to filter Entities that can be added to this layer
  List<String>? requiredTags;

  ///If the tiles are smaller or larger than the layer grid, the pivot value will be used to
  ///position the tile relatively its grid cell.
  double? tilePivotX;

  ///If the tiles are smaller or larger than the layer grid, the pivot value will be used to
  ///position the tile relatively its grid cell.
  double? tilePivotY;

  ///Reference to the default Tileset UID being used by this layer definition.<br/>
  ///**WARNING**: some layer *instances* might use a different tileset. So most of the time,
  ///you should probably use the `__tilesetDefUid` value found in layer instances.<br/>  Note:
  ///since version 1.0.0, the old `autoTilesetDefUid` was removed and merged into this value.
  int? tilesetDefUid;

  ///Type of the layer as Haxe Enum Possible values: `IntGrid`, `Entities`, `Tiles`,
  ///`AutoLayer`
  Type? layerDefinitionType;

  ///Unique Int identifier
  int? uid;

  factory LayerDefinition.fromRawJson(String str) =>
      LayerDefinition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LayerDefinition.fromJson(Map<String, dynamic> json) =>
      LayerDefinition(
        type: json["__type"],
        autoRuleGroups: json["autoRuleGroups"] == null
            ? []
            : List<AutoLayerRuleGroup>.from(json["autoRuleGroups"]!
                .map((x) => AutoLayerRuleGroup.fromJson(x))),
        autoSourceLayerDefUid: json["autoSourceLayerDefUid"],
        autoTilesetDefUid: json["autoTilesetDefUid"],
        canSelectWhenInactive: json["canSelectWhenInactive"],
        displayOpacity: json["displayOpacity"]?.toDouble(),
        doc: json["doc"],
        excludedTags: json["excludedTags"] == null
            ? []
            : List<String>.from(json["excludedTags"]!.map((x) => x)),
        gridSize: json["gridSize"],
        guideGridHei: json["guideGridHei"],
        guideGridWid: json["guideGridWid"],
        hideFieldsWhenInactive: json["hideFieldsWhenInactive"],
        hideInList: json["hideInList"],
        identifier: json["identifier"],
        inactiveOpacity: json["inactiveOpacity"]?.toDouble(),
        intGridValues: json["intGridValues"] == null
            ? []
            : List<IntGridValueDefinition>.from(json["intGridValues"]!
                .map((x) => IntGridValueDefinition.fromJson(x))),
        parallaxFactorX: json["parallaxFactorX"]?.toDouble(),
        parallaxFactorY: json["parallaxFactorY"]?.toDouble(),
        parallaxScaling: json["parallaxScaling"],
        pxOffsetX: json["pxOffsetX"],
        pxOffsetY: json["pxOffsetY"],
        requiredTags: json["requiredTags"] == null
            ? []
            : List<String>.from(json["requiredTags"]!.map((x) => x)),
        tilePivotX: json["tilePivotX"]?.toDouble(),
        tilePivotY: json["tilePivotY"]?.toDouble(),
        tilesetDefUid: json["tilesetDefUid"],
        layerDefinitionType: typeValues.map[json["type"]],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "__type": type,
        "autoRuleGroups": autoRuleGroups == null
            ? []
            : List<dynamic>.from(autoRuleGroups!.map((x) => x.toJson())),
        "autoSourceLayerDefUid": autoSourceLayerDefUid,
        "autoTilesetDefUid": autoTilesetDefUid,
        "canSelectWhenInactive": canSelectWhenInactive,
        "displayOpacity": displayOpacity,
        "doc": doc,
        "excludedTags": excludedTags == null
            ? []
            : List<dynamic>.from(excludedTags!.map((x) => x)),
        "gridSize": gridSize,
        "guideGridHei": guideGridHei,
        "guideGridWid": guideGridWid,
        "hideFieldsWhenInactive": hideFieldsWhenInactive,
        "hideInList": hideInList,
        "identifier": identifier,
        "inactiveOpacity": inactiveOpacity,
        "intGridValues": intGridValues == null
            ? []
            : List<dynamic>.from(intGridValues!.map((x) => x.toJson())),
        "parallaxFactorX": parallaxFactorX,
        "parallaxFactorY": parallaxFactorY,
        "parallaxScaling": parallaxScaling,
        "pxOffsetX": pxOffsetX,
        "pxOffsetY": pxOffsetY,
        "requiredTags": requiredTags == null
            ? []
            : List<dynamic>.from(requiredTags!.map((x) => x)),
        "tilePivotX": tilePivotX,
        "tilePivotY": tilePivotY,
        "tilesetDefUid": tilesetDefUid,
        "type": typeValues.reverse[layerDefinitionType],
        "uid": uid,
      };
}

class AutoLayerRuleGroup {
  AutoLayerRuleGroup({
    this.active,
    this.collapsed,
    this.isOptional,
    this.name,
    this.rules,
    this.uid,
    this.usesWizard,
  });

  bool? active;

  ///*This field was removed in 1.0.0 and should no longer be used.*
  bool? collapsed;
  bool? isOptional;
  String? name;
  List<AutoLayerRuleDefinition>? rules;
  int? uid;
  bool? usesWizard;

  factory AutoLayerRuleGroup.fromRawJson(String str) =>
      AutoLayerRuleGroup.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AutoLayerRuleGroup.fromJson(Map<String, dynamic> json) =>
      AutoLayerRuleGroup(
        active: json["active"],
        collapsed: json["collapsed"],
        isOptional: json["isOptional"],
        name: json["name"],
        rules: json["rules"] == null
            ? []
            : List<AutoLayerRuleDefinition>.from(
                json["rules"]!.map((x) => AutoLayerRuleDefinition.fromJson(x))),
        uid: json["uid"],
        usesWizard: json["usesWizard"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "collapsed": collapsed,
        "isOptional": isOptional,
        "name": name,
        "rules": rules == null
            ? []
            : List<dynamic>.from(rules!.map((x) => x.toJson())),
        "uid": uid,
        "usesWizard": usesWizard,
      };
}

///This complex section isn't meant to be used by game devs at all, as these rules are
///completely resolved internally by the editor before any saving. You should just ignore
///this part.
class AutoLayerRuleDefinition {
  AutoLayerRuleDefinition({
    this.active,
    this.breakOnMatch,
    this.chance,
    this.checker,
    this.flipX,
    this.flipY,
    this.outOfBoundsValue,
    this.pattern,
    this.perlinActive,
    this.perlinOctaves,
    this.perlinScale,
    this.perlinSeed,
    this.pivotX,
    this.pivotY,
    this.size,
    this.tileIds,
    this.tileMode,
    this.uid,
    this.xModulo,
    this.xOffset,
    this.yModulo,
    this.yOffset,
  });

  ///If FALSE, the rule effect isn't applied, and no tiles are generated.
  bool? active;

  ///When TRUE, the rule will prevent other rules to be applied in the same cell if it matches
  ///(TRUE by default).
  bool? breakOnMatch;

  ///Chances for this rule to be applied (0 to 1)
  double? chance;

  ///Checker mode Possible values: `None`, `Horizontal`, `Vertical`
  Checker? checker;

  ///If TRUE, allow rule to be matched by flipping its pattern horizontally
  bool? flipX;

  ///If TRUE, allow rule to be matched by flipping its pattern vertically
  bool? flipY;

  ///Default IntGrid value when checking cells outside of level bounds
  int? outOfBoundsValue;

  ///Rule pattern (size x size)
  List<int>? pattern;

  ///If TRUE, enable Perlin filtering to only apply rule on specific random area
  bool? perlinActive;
  double? perlinOctaves;
  double? perlinScale;
  double? perlinSeed;

  ///X pivot of a tile stamp (0-1)
  double? pivotX;

  ///Y pivot of a tile stamp (0-1)
  double? pivotY;

  ///Pattern width & height. Should only be 1,3,5 or 7.
  int? size;

  ///Array of all the tile IDs. They are used randomly or as stamps, based on `tileMode` value.
  List<int>? tileIds;

  ///Defines how tileIds array is used Possible values: `Single`, `Stamp`
  TileMode? tileMode;

  ///Unique Int identifier
  int? uid;

  ///X cell coord modulo
  int? xModulo;

  ///X cell start offset
  int? xOffset;

  ///Y cell coord modulo
  int? yModulo;

  ///Y cell start offset
  int? yOffset;

  factory AutoLayerRuleDefinition.fromRawJson(String str) =>
      AutoLayerRuleDefinition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AutoLayerRuleDefinition.fromJson(Map<String, dynamic> json) =>
      AutoLayerRuleDefinition(
        active: json["active"],
        breakOnMatch: json["breakOnMatch"],
        chance: json["chance"]?.toDouble(),
        checker: checkerValues.map[json["checker"]],
        flipX: json["flipX"],
        flipY: json["flipY"],
        outOfBoundsValue: json["outOfBoundsValue"],
        pattern: json["pattern"] == null
            ? []
            : List<int>.from(json["pattern"]!.map((x) => x)),
        perlinActive: json["perlinActive"],
        perlinOctaves: json["perlinOctaves"]?.toDouble(),
        perlinScale: json["perlinScale"]?.toDouble(),
        perlinSeed: json["perlinSeed"]?.toDouble(),
        pivotX: json["pivotX"]?.toDouble(),
        pivotY: json["pivotY"]?.toDouble(),
        size: json["size"],
        tileIds: json["tileIds"] == null
            ? []
            : List<int>.from(json["tileIds"]!.map((x) => x)),
        tileMode: tileModeValues.map[json["tileMode"]],
        uid: json["uid"],
        xModulo: json["xModulo"],
        xOffset: json["xOffset"],
        yModulo: json["yModulo"],
        yOffset: json["yOffset"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "breakOnMatch": breakOnMatch,
        "chance": chance,
        "checker": checkerValues.reverse[checker],
        "flipX": flipX,
        "flipY": flipY,
        "outOfBoundsValue": outOfBoundsValue,
        "pattern":
            pattern == null ? [] : List<dynamic>.from(pattern!.map((x) => x)),
        "perlinActive": perlinActive,
        "perlinOctaves": perlinOctaves,
        "perlinScale": perlinScale,
        "perlinSeed": perlinSeed,
        "pivotX": pivotX,
        "pivotY": pivotY,
        "size": size,
        "tileIds":
            tileIds == null ? [] : List<dynamic>.from(tileIds!.map((x) => x)),
        "tileMode": tileModeValues.reverse[tileMode],
        "uid": uid,
        "xModulo": xModulo,
        "xOffset": xOffset,
        "yModulo": yModulo,
        "yOffset": yOffset,
      };
}

///Checker mode Possible values: `None`, `Horizontal`, `Vertical`
enum Checker { NONE, HORIZONTAL, VERTICAL }

final checkerValues = EnumValues({
  "Horizontal": Checker.HORIZONTAL,
  "None": Checker.NONE,
  "Vertical": Checker.VERTICAL
});

///Defines how tileIds array is used Possible values: `Single`, `Stamp`
enum TileMode { SINGLE, STAMP }

final tileModeValues =
    EnumValues({"Single": TileMode.SINGLE, "Stamp": TileMode.STAMP});

///IntGrid value definition
class IntGridValueDefinition {
  IntGridValueDefinition({
    this.color,
    this.identifier,
    this.value,
  });

  String? color;

  ///User defined unique identifier
  String? identifier;

  ///The IntGrid value itself
  int? value;

  factory IntGridValueDefinition.fromRawJson(String str) =>
      IntGridValueDefinition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IntGridValueDefinition.fromJson(Map<String, dynamic> json) =>
      IntGridValueDefinition(
        color: json["color"],
        identifier: json["identifier"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "identifier": identifier,
        "value": value,
      };
}

///Type of the layer as Haxe Enum Possible values: `IntGrid`, `Entities`, `Tiles`,
///`AutoLayer`
enum Type { INT_GRID, ENTITIES, TILES, AUTO_LAYER }

final typeValues = EnumValues({
  "AutoLayer": Type.AUTO_LAYER,
  "Entities": Type.ENTITIES,
  "IntGrid": Type.INT_GRID,
  "Tiles": Type.TILES
});

///The `Tileset` definition is the most important part among project definitions. It
///contains some extra informations about each integrated tileset. If you only had to parse
///one definition section, that would be the one.
class TilesetDefinition {
  TilesetDefinition({
    this.cHei,
    this.cWid,
    this.cachedPixelData,
    this.customData,
    this.embedAtlas,
    this.enumTags,
    this.identifier,
    this.padding,
    this.pxHei,
    this.pxWid,
    this.relPath,
    this.savedSelections,
    this.spacing,
    this.tags,
    this.tagsSourceEnumUid,
    this.tileGridSize,
    this.uid,
  });

  ///Grid-based height
  int? cHei;

  ///Grid-based width
  int? cWid;

  ///The following data is used internally for various optimizations. It's always synced with
  ///source image changes.
  Map<String, dynamic>? cachedPixelData;

  ///An array of custom tile metadata
  List<TileCustomMetadata>? customData;

  ///If this value is set, then it means that this atlas uses an internal LDtk atlas image
  ///instead of a loaded one. Possible values: &lt;`null`&gt;, `LdtkIcons`
  EmbedAtlas? embedAtlas;

  ///Tileset tags using Enum values specified by `tagsSourceEnumId`. This array contains 1
  ///element per Enum value, which contains an array of all Tile IDs that are tagged with it.
  List<EnumTagValue>? enumTags;

  ///User defined unique identifier
  String? identifier;

  ///Distance in pixels from image borders
  int? padding;

  ///Image height in pixels
  int? pxHei;

  ///Image width in pixels
  int? pxWid;

  ///Path to the source file, relative to the current project JSON file<br/>  It can be null
  ///if no image was provided, or when using an embed atlas.
  String? relPath;

  ///Array of group of tiles selections, only meant to be used in the editor
  List<Map<String, dynamic>>? savedSelections;

  ///Space in pixels between all tiles
  int? spacing;

  ///An array of user-defined tags to organize the Tilesets
  List<String>? tags;

  ///Optional Enum definition UID used for this tileset meta-data
  int? tagsSourceEnumUid;
  int? tileGridSize;

  ///Unique Intidentifier
  int? uid;

  factory TilesetDefinition.fromRawJson(String str) =>
      TilesetDefinition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TilesetDefinition.fromJson(Map<String, dynamic> json) =>
      TilesetDefinition(
        cHei: json["__cHei"],
        cWid: json["__cWid"],
        cachedPixelData:
            Map.from(json["cachedPixelData"] ?? <String, dynamic>{})
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        customData: json["customData"] == null
            ? []
            : List<TileCustomMetadata>.from(
                json["customData"]!.map((x) => TileCustomMetadata.fromJson(x))),
        embedAtlas: embedAtlasValues.map[json["embedAtlas"]],
        enumTags: json["enumTags"] == null
            ? []
            : List<EnumTagValue>.from(
                json["enumTags"]!.map((x) => EnumTagValue.fromJson(x))),
        identifier: json["identifier"],
        padding: json["padding"],
        pxHei: json["pxHei"],
        pxWid: json["pxWid"],
        relPath: json["relPath"],
        savedSelections: json["savedSelections"] == null
            ? []
            : List<Map<String, dynamic>>.from(json["savedSelections"]!.map(
                (x) => Map.from(x)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)))),
        spacing: json["spacing"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        tagsSourceEnumUid: json["tagsSourceEnumUid"],
        tileGridSize: json["tileGridSize"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "__cHei": cHei,
        "__cWid": cWid,
        "cachedPixelData": Map.from(cachedPixelData!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "customData": customData == null
            ? []
            : List<dynamic>.from(customData!.map((x) => x.toJson())),
        "embedAtlas": embedAtlasValues.reverse[embedAtlas],
        "enumTags": enumTags == null
            ? []
            : List<dynamic>.from(enumTags!.map((x) => x.toJson())),
        "identifier": identifier,
        "padding": padding,
        "pxHei": pxHei,
        "pxWid": pxWid,
        "relPath": relPath,
        "savedSelections": savedSelections == null
            ? []
            : List<dynamic>.from(savedSelections!.map((x) =>
                Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "spacing": spacing,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "tagsSourceEnumUid": tagsSourceEnumUid,
        "tileGridSize": tileGridSize,
        "uid": uid,
      };
}

///In a tileset definition, user defined meta-data of a tile.
class TileCustomMetadata {
  TileCustomMetadata({
    this.data,
    this.tileId,
  });

  String? data;
  int? tileId;

  factory TileCustomMetadata.fromRawJson(String str) =>
      TileCustomMetadata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TileCustomMetadata.fromJson(Map<String, dynamic> json) =>
      TileCustomMetadata(
        data: json["data"],
        tileId: json["tileId"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "tileId": tileId,
      };
}

enum EmbedAtlas { LDTK_ICONS }

final embedAtlasValues = EnumValues({"LdtkIcons": EmbedAtlas.LDTK_ICONS});

///In a tileset definition, enum based tag infos
class EnumTagValue {
  EnumTagValue({
    this.enumValueId,
    this.tileIds,
  });

  String? enumValueId;
  List<int>? tileIds;

  factory EnumTagValue.fromRawJson(String str) =>
      EnumTagValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EnumTagValue.fromJson(Map<String, dynamic> json) => EnumTagValue(
        enumValueId: json["enumValueId"],
        tileIds: json["tileIds"] == null
            ? []
            : List<int>.from(json["tileIds"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "enumValueId": enumValueId,
        "tileIds":
            tileIds == null ? [] : List<dynamic>.from(tileIds!.map((x) => x)),
      };
}

enum Flag {
  DISCARD_PRE_CSV_INT_GRID,
  EXPORT_PRE_CSV_INT_GRID_FORMAT,
  IGNORE_BACKUP_SUGGEST,
  PREPEND_INDEX_TO_LEVEL_FILE_NAMES,
  MULTI_WORLDS,
  USE_MULTILINES_TYPE
}

final flagValues = EnumValues({
  "DiscardPreCsvIntGrid": Flag.DISCARD_PRE_CSV_INT_GRID,
  "ExportPreCsvIntGridFormat": Flag.EXPORT_PRE_CSV_INT_GRID_FORMAT,
  "IgnoreBackupSuggest": Flag.IGNORE_BACKUP_SUGGEST,
  "MultiWorlds": Flag.MULTI_WORLDS,
  "PrependIndexToLevelFileNames": Flag.PREPEND_INDEX_TO_LEVEL_FILE_NAMES,
  "UseMultilinesType": Flag.USE_MULTILINES_TYPE
});

///This object is not actually used by LDtk. It ONLY exists to force explicit references to
///all types, to make sure QuickType finds them and integrate all of them. Otherwise,
///Quicktype will drop types that are not explicitely used.
class ForcedRefs {
  ForcedRefs({
    this.autoLayerRuleGroup,
    this.autoRuleDef,
    this.customCommand,
    this.definitions,
    this.entityDef,
    this.entityInstance,
    this.entityReferenceInfos,
    this.enumDef,
    this.enumDefValues,
    this.enumTagValue,
    this.fieldDef,
    this.fieldInstance,
    this.gridPoint,
    this.intGridValueDef,
    this.intGridValueInstance,
    this.layerDef,
    this.layerInstance,
    this.level,
    this.levelBgPosInfos,
    this.neighbourLevel,
    this.tableOfContentEntry,
    this.tile,
    this.tileCustomMetadata,
    this.tilesetDef,
    this.tilesetRect,
    this.world,
  });

  AutoLayerRuleGroup? autoLayerRuleGroup;
  AutoLayerRuleDefinition? autoRuleDef;
  LdtkCustomCommand? customCommand;
  Definitions? definitions;
  EntityDefinition? entityDef;
  EntityInstance? entityInstance;
  ReferenceToAnEntityInstance? entityReferenceInfos;
  EnumDefinition? enumDef;
  EnumValueDefinition? enumDefValues;
  EnumTagValue? enumTagValue;
  FieldDefinition? fieldDef;
  FieldInstance? fieldInstance;
  GridPoint? gridPoint;
  IntGridValueDefinition? intGridValueDef;
  IntGridValueInstance? intGridValueInstance;
  LayerDefinition? layerDef;
  LayerInstance? layerInstance;
  Level? level;
  LevelBackgroundPosition? levelBgPosInfos;
  NeighbourLevel? neighbourLevel;
  LdtkTableOfContentEntry? tableOfContentEntry;
  TileInstance? tile;
  TileCustomMetadata? tileCustomMetadata;
  TilesetDefinition? tilesetDef;
  TilesetRectangle? tilesetRect;
  World? world;

  factory ForcedRefs.fromRawJson(String str) =>
      ForcedRefs.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForcedRefs.fromJson(Map<String, dynamic> json) => ForcedRefs(
        autoLayerRuleGroup: json["AutoLayerRuleGroup"] == null
            ? null
            : AutoLayerRuleGroup.fromJson(json["AutoLayerRuleGroup"]),
        autoRuleDef: json["AutoRuleDef"] == null
            ? null
            : AutoLayerRuleDefinition.fromJson(json["AutoRuleDef"]),
        customCommand: json["CustomCommand"] == null
            ? null
            : LdtkCustomCommand.fromJson(json["CustomCommand"]),
        definitions: json["Definitions"] == null
            ? null
            : Definitions.fromJson(json["Definitions"]),
        entityDef: json["EntityDef"] == null
            ? null
            : EntityDefinition.fromJson(json["EntityDef"]),
        entityInstance: json["EntityInstance"] == null
            ? null
            : EntityInstance.fromJson(json["EntityInstance"]),
        entityReferenceInfos: json["EntityReferenceInfos"] == null
            ? null
            : ReferenceToAnEntityInstance.fromJson(
                json["EntityReferenceInfos"]),
        enumDef: json["EnumDef"] == null
            ? null
            : EnumDefinition.fromJson(json["EnumDef"]),
        enumDefValues: json["EnumDefValues"] == null
            ? null
            : EnumValueDefinition.fromJson(json["EnumDefValues"]),
        enumTagValue: json["EnumTagValue"] == null
            ? null
            : EnumTagValue.fromJson(json["EnumTagValue"]),
        fieldDef: json["FieldDef"] == null
            ? null
            : FieldDefinition.fromJson(json["FieldDef"]),
        fieldInstance: json["FieldInstance"] == null
            ? null
            : FieldInstance.fromJson(json["FieldInstance"]),
        gridPoint: json["GridPoint"] == null
            ? null
            : GridPoint.fromJson(json["GridPoint"]),
        intGridValueDef: json["IntGridValueDef"] == null
            ? null
            : IntGridValueDefinition.fromJson(json["IntGridValueDef"]),
        intGridValueInstance: json["IntGridValueInstance"] == null
            ? null
            : IntGridValueInstance.fromJson(json["IntGridValueInstance"]),
        layerDef: json["LayerDef"] == null
            ? null
            : LayerDefinition.fromJson(json["LayerDef"]),
        layerInstance: json["LayerInstance"] == null
            ? null
            : LayerInstance.fromJson(json["LayerInstance"]),
        level: json["Level"] == null ? null : Level.fromJson(json["Level"]),
        levelBgPosInfos: json["LevelBgPosInfos"] == null
            ? null
            : LevelBackgroundPosition.fromJson(json["LevelBgPosInfos"]),
        neighbourLevel: json["NeighbourLevel"] == null
            ? null
            : NeighbourLevel.fromJson(json["NeighbourLevel"]),
        tableOfContentEntry: json["TableOfContentEntry"] == null
            ? null
            : LdtkTableOfContentEntry.fromJson(json["TableOfContentEntry"]),
        tile: json["Tile"] == null ? null : TileInstance.fromJson(json["Tile"]),
        tileCustomMetadata: json["TileCustomMetadata"] == null
            ? null
            : TileCustomMetadata.fromJson(json["TileCustomMetadata"]),
        tilesetDef: json["TilesetDef"] == null
            ? null
            : TilesetDefinition.fromJson(json["TilesetDef"]),
        tilesetRect: json["TilesetRect"] == null
            ? null
            : TilesetRectangle.fromJson(json["TilesetRect"]),
        world: json["World"] == null ? null : World.fromJson(json["World"]),
      );

  Map<String, dynamic> toJson() => {
        "AutoLayerRuleGroup": autoLayerRuleGroup?.toJson(),
        "AutoRuleDef": autoRuleDef?.toJson(),
        "CustomCommand": customCommand?.toJson(),
        "Definitions": definitions?.toJson(),
        "EntityDef": entityDef?.toJson(),
        "EntityInstance": entityInstance?.toJson(),
        "EntityReferenceInfos": entityReferenceInfos?.toJson(),
        "EnumDef": enumDef?.toJson(),
        "EnumDefValues": enumDefValues?.toJson(),
        "EnumTagValue": enumTagValue?.toJson(),
        "FieldDef": fieldDef?.toJson(),
        "FieldInstance": fieldInstance?.toJson(),
        "GridPoint": gridPoint?.toJson(),
        "IntGridValueDef": intGridValueDef?.toJson(),
        "IntGridValueInstance": intGridValueInstance?.toJson(),
        "LayerDef": layerDef?.toJson(),
        "LayerInstance": layerInstance?.toJson(),
        "Level": level?.toJson(),
        "LevelBgPosInfos": levelBgPosInfos?.toJson(),
        "NeighbourLevel": neighbourLevel?.toJson(),
        "TableOfContentEntry": tableOfContentEntry?.toJson(),
        "Tile": tile?.toJson(),
        "TileCustomMetadata": tileCustomMetadata?.toJson(),
        "TilesetDef": tilesetDef?.toJson(),
        "TilesetRect": tilesetRect?.toJson(),
        "World": world?.toJson(),
      };
}

class EntityInstance {
  EntityInstance({
    this.grid,
    this.identifier,
    this.pivot,
    this.smartColor,
    this.tags,
    this.tile,
    this.defUid,
    this.fieldInstances,
    this.height,
    this.iid,
    this.px,
    this.width,
  });

  ///Grid-based coordinates (`[x,y]` format)
  List<int>? grid;

  ///Entity definition identifier
  String? identifier;

  ///Pivot coordinates  (`[x,y]` format, values are from 0 to 1) of the Entity
  List<double>? pivot;

  ///The entity "smart" color, guessed from either Entity definition, or one its field
  ///instances.
  String? smartColor;

  ///Array of tags defined in this Entity definition
  List<String>? tags;

  ///Optional TilesetRect used to display this entity (it could either be the default Entity
  ///tile, or some tile provided by a field value, like an Enum).
  TilesetRectangle? tile;

  ///Reference of the **Entity definition** UID
  int? defUid;

  ///An array of all custom fields and their values.
  List<FieldInstance>? fieldInstances;

  ///Entity height in pixels. For non-resizable entities, it will be the same as Entity
  ///definition.
  int? height;

  ///Unique instance identifier
  String? iid;

  ///Pixel coordinates (`[x,y]` format) in current level coordinate space. Don't forget
  ///optional layer offsets, if they exist!
  List<int>? px;

  ///Entity width in pixels. For non-resizable entities, it will be the same as Entity
  ///definition.
  int? width;

  factory EntityInstance.fromRawJson(String str) =>
      EntityInstance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EntityInstance.fromJson(Map<String, dynamic> json) => EntityInstance(
        grid: json["__grid"] == null
            ? []
            : List<int>.from(json["__grid"]!.map((x) => x)),
        identifier: json["__identifier"],
        pivot: json["__pivot"] == null
            ? []
            : List<double>.from(json["__pivot"]!.map((x) => x?.toDouble())),
        smartColor: json["__smartColor"],
        tags: json["__tags"] == null
            ? []
            : List<String>.from(json["__tags"]!.map((x) => x)),
        tile: json["__tile"] == null
            ? null
            : TilesetRectangle.fromJson(json["__tile"]),
        defUid: json["defUid"],
        fieldInstances: json["fieldInstances"] == null
            ? []
            : List<FieldInstance>.from(
                json["fieldInstances"]!.map((x) => FieldInstance.fromJson(x))),
        height: json["height"],
        iid: json["iid"],
        px: json["px"] == null ? [] : List<int>.from(json["px"]!.map((x) => x)),
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "__grid": grid == null ? [] : List<dynamic>.from(grid!.map((x) => x)),
        "__identifier": identifier,
        "__pivot":
            pivot == null ? [] : List<dynamic>.from(pivot!.map((x) => x)),
        "__smartColor": smartColor,
        "__tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "__tile": tile?.toJson(),
        "defUid": defUid,
        "fieldInstances": fieldInstances == null
            ? []
            : List<dynamic>.from(fieldInstances!.map((x) => x.toJson())),
        "height": height,
        "iid": iid,
        "px": px == null ? [] : List<dynamic>.from(px!.map((x) => x)),
        "width": width,
      };
}

class FieldInstance {
  FieldInstance({
    this.identifier,
    this.tile,
    this.type,
    this.value,
    this.defUid,
    this.realEditorValues,
  });

  ///Field definition identifier
  String? identifier;

  ///Optional TilesetRect used to display this field (this can be the field own Tile, or some
  ///other Tile guessed from the value, like an Enum).
  TilesetRectangle? tile;

  ///Type of the field, such as `Int`, `Float`, `String`, `Enum(my_enum_name)`, `Bool`,
  ///etc.<br/>  NOTE: if you enable the advanced option **Use Multilines type**, you will have
  ///"*Multilines*" instead of "*String*" when relevant.
  String? type;

  ///Actual value of the field instance. The value type varies, depending on `__type`:<br/>
  ///- For **classic types** (ie. Integer, Float, Boolean, String, Text and FilePath), you
  ///just get the actual value with the expected type.<br/>   - For **Color**, the value is an
  ///hexadecimal string using "#rrggbb" format.<br/>   - For **Enum**, the value is a String
  ///representing the selected enum value.<br/>   - For **Point**, the value is a
  ///[GridPoint](#ldtk-GridPoint) object.<br/>   - For **Tile**, the value is a
  ///[TilesetRect](#ldtk-TilesetRect) object.<br/>   - For **EntityRef**, the value is an
  ///[EntityReferenceInfos](#ldtk-EntityReferenceInfos) object.<br/><br/>  If the field is an
  ///array, then this `__value` will also be a JSON array.
  dynamic value;

  ///Reference of the **Field definition** UID
  int? defUid;

  ///Editor internal raw values
  List<dynamic>? realEditorValues;

  factory FieldInstance.fromRawJson(String str) =>
      FieldInstance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FieldInstance.fromJson(Map<String, dynamic> json) => FieldInstance(
        identifier: json["__identifier"],
        tile: json["__tile"] == null
            ? null
            : TilesetRectangle.fromJson(json["__tile"]),
        type: json["__type"],
        value: json["__value"],
        defUid: json["defUid"],
        realEditorValues: json["realEditorValues"] == null
            ? []
            : List<dynamic>.from(json["realEditorValues"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "__identifier": identifier,
        "__tile": tile?.toJson(),
        "__type": type,
        "__value": value,
        "defUid": defUid,
        "realEditorValues": realEditorValues == null
            ? []
            : List<dynamic>.from(realEditorValues!.map((x) => x)),
      };
}

///This object describes the "location" of an Entity instance in the project worlds.
class ReferenceToAnEntityInstance {
  ReferenceToAnEntityInstance({
    this.entityIid,
    this.layerIid,
    this.levelIid,
    this.worldIid,
  });

  ///IID of the refered EntityInstance
  String? entityIid;

  ///IID of the LayerInstance containing the refered EntityInstance
  String? layerIid;

  ///IID of the Level containing the refered EntityInstance
  String? levelIid;

  ///IID of the World containing the refered EntityInstance
  String? worldIid;

  factory ReferenceToAnEntityInstance.fromRawJson(String str) =>
      ReferenceToAnEntityInstance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReferenceToAnEntityInstance.fromJson(Map<String, dynamic> json) =>
      ReferenceToAnEntityInstance(
        entityIid: json["entityIid"],
        layerIid: json["layerIid"],
        levelIid: json["levelIid"],
        worldIid: json["worldIid"],
      );

  Map<String, dynamic> toJson() => {
        "entityIid": entityIid,
        "layerIid": layerIid,
        "levelIid": levelIid,
        "worldIid": worldIid,
      };
}

///This object is just a grid-based coordinate used in Field values.
class GridPoint {
  GridPoint({
    this.cx,
    this.cy,
  });

  ///X grid-based coordinate
  int? cx;

  ///Y grid-based coordinate
  int? cy;

  factory GridPoint.fromRawJson(String str) =>
      GridPoint.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GridPoint.fromJson(Map<String, dynamic> json) => GridPoint(
        cx: json["cx"],
        cy: json["cy"],
      );

  Map<String, dynamic> toJson() => {
        "cx": cx,
        "cy": cy,
      };
}

///IntGrid value instance
class IntGridValueInstance {
  IntGridValueInstance({
    this.coordId,
    this.v,
  });

  ///Coordinate ID in the layer grid
  int? coordId;

  ///IntGrid value
  int? v;

  factory IntGridValueInstance.fromRawJson(String str) =>
      IntGridValueInstance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IntGridValueInstance.fromJson(Map<String, dynamic> json) =>
      IntGridValueInstance(
        coordId: json["coordId"],
        v: json["v"],
      );

  Map<String, dynamic> toJson() => {
        "coordId": coordId,
        "v": v,
      };
}

class LayerInstance {
  LayerInstance({
    this.cHei,
    this.cWid,
    this.gridSize,
    this.identifier,
    this.opacity,
    this.pxTotalOffsetX,
    this.pxTotalOffsetY,
    this.tilesetDefUid,
    this.tilesetRelPath,
    this.type,
    this.autoLayerTiles,
    this.entityInstances,
    this.gridTiles,
    this.iid,
    this.intGrid,
    this.intGridCsv,
    this.layerDefUid,
    this.levelId,
    this.optionalRules,
    this.overrideTilesetUid,
    this.pxOffsetX,
    this.pxOffsetY,
    this.seed,
    this.visible,
  });

  ///Grid-based height
  int? cHei;

  ///Grid-based width
  int? cWid;

  ///Grid size
  int? gridSize;

  ///Layer definition identifier
  String? identifier;

  ///Layer opacity as Float [0-1]
  double? opacity;

  ///Total layer X pixel offset, including both instance and definition offsets.
  int? pxTotalOffsetX;

  ///Total layer Y pixel offset, including both instance and definition offsets.
  int? pxTotalOffsetY;

  ///The definition UID of corresponding Tileset, if any.
  int? tilesetDefUid;

  ///The relative path to corresponding Tileset, if any.
  String? tilesetRelPath;

  ///Layer type (possible values: IntGrid, Entities, Tiles or AutoLayer)
  String? type;

  ///An array containing all tiles generated by Auto-layer rules. The array is already sorted
  ///in display order (ie. 1st tile is beneath 2nd, which is beneath 3rd etc.).<br/><br/>
  ///Note: if multiple tiles are stacked in the same cell as the result of different rules,
  ///all tiles behind opaque ones will be discarded.
  List<TileInstance>? autoLayerTiles;
  List<EntityInstance>? entityInstances;
  List<TileInstance>? gridTiles;

  ///Unique layer instance identifier
  String? iid;

  ///**WARNING**: this deprecated value is no longer exported since version 1.0.0  Replaced
  ///by: `intGridCsv`
  List<IntGridValueInstance>? intGrid;

  ///A list of all values in the IntGrid layer, stored in CSV format (Comma Separated
  ///Values).<br/>  Order is from left to right, and top to bottom (ie. first row from left to
  ///right, followed by second row, etc).<br/>  `0` means "empty cell" and IntGrid values
  ///start at 1.<br/>  The array size is `__cWid` x `__cHei` cells.
  List<int>? intGridCsv;

  ///Reference the Layer definition UID
  int? layerDefUid;

  ///Reference to the UID of the level containing this layer instance
  int? levelId;

  ///An Array containing the UIDs of optional rules that were enabled in this specific layer
  ///instance.
  List<int>? optionalRules;

  ///This layer can use another tileset by overriding the tileset UID here.
  int? overrideTilesetUid;

  ///X offset in pixels to render this layer, usually 0 (IMPORTANT: this should be added to
  ///the `LayerDef` optional offset, so you should probably prefer using `__pxTotalOffsetX`
  ///which contains the total offset value)
  int? pxOffsetX;

  ///Y offset in pixels to render this layer, usually 0 (IMPORTANT: this should be added to
  ///the `LayerDef` optional offset, so you should probably prefer using `__pxTotalOffsetX`
  ///which contains the total offset value)
  int? pxOffsetY;

  ///Random seed used for Auto-Layers rendering
  int? seed;

  ///Layer instance visibility
  bool? visible;

  factory LayerInstance.fromRawJson(String str) =>
      LayerInstance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LayerInstance.fromJson(Map<String, dynamic> json) => LayerInstance(
        cHei: json["__cHei"],
        cWid: json["__cWid"],
        gridSize: json["__gridSize"],
        identifier: json["__identifier"],
        opacity: json["__opacity"]?.toDouble(),
        pxTotalOffsetX: json["__pxTotalOffsetX"],
        pxTotalOffsetY: json["__pxTotalOffsetY"],
        tilesetDefUid: json["__tilesetDefUid"],
        tilesetRelPath: json["__tilesetRelPath"],
        type: json["__type"],
        autoLayerTiles: json["autoLayerTiles"] == null
            ? []
            : List<TileInstance>.from(
                json["autoLayerTiles"]!.map((x) => TileInstance.fromJson(x))),
        entityInstances: json["entityInstances"] == null
            ? []
            : List<EntityInstance>.from(json["entityInstances"]!
                .map((x) => EntityInstance.fromJson(x))),
        gridTiles: json["gridTiles"] == null
            ? []
            : List<TileInstance>.from(
                json["gridTiles"]!.map((x) => TileInstance.fromJson(x))),
        iid: json["iid"],
        intGrid: json["intGrid"] == null
            ? []
            : List<IntGridValueInstance>.from(
                json["intGrid"]!.map((x) => IntGridValueInstance.fromJson(x))),
        intGridCsv: json["intGridCsv"] == null
            ? []
            : List<int>.from(json["intGridCsv"]!.map((x) => x)),
        layerDefUid: json["layerDefUid"],
        levelId: json["levelId"],
        optionalRules: json["optionalRules"] == null
            ? []
            : List<int>.from(json["optionalRules"]!.map((x) => x)),
        overrideTilesetUid: json["overrideTilesetUid"],
        pxOffsetX: json["pxOffsetX"],
        pxOffsetY: json["pxOffsetY"],
        seed: json["seed"],
        visible: json["visible"],
      );

  Map<String, dynamic> toJson() => {
        "__cHei": cHei,
        "__cWid": cWid,
        "__gridSize": gridSize,
        "__identifier": identifier,
        "__opacity": opacity,
        "__pxTotalOffsetX": pxTotalOffsetX,
        "__pxTotalOffsetY": pxTotalOffsetY,
        "__tilesetDefUid": tilesetDefUid,
        "__tilesetRelPath": tilesetRelPath,
        "__type": type,
        "autoLayerTiles": autoLayerTiles == null
            ? []
            : List<dynamic>.from(autoLayerTiles!.map((x) => x.toJson())),
        "entityInstances": entityInstances == null
            ? []
            : List<dynamic>.from(entityInstances!.map((x) => x.toJson())),
        "gridTiles": gridTiles == null
            ? []
            : List<dynamic>.from(gridTiles!.map((x) => x.toJson())),
        "iid": iid,
        "intGrid": intGrid == null
            ? []
            : List<dynamic>.from(intGrid!.map((x) => x.toJson())),
        "intGridCsv": intGridCsv == null
            ? []
            : List<dynamic>.from(intGridCsv!.map((x) => x)),
        "layerDefUid": layerDefUid,
        "levelId": levelId,
        "optionalRules": optionalRules == null
            ? []
            : List<dynamic>.from(optionalRules!.map((x) => x)),
        "overrideTilesetUid": overrideTilesetUid,
        "pxOffsetX": pxOffsetX,
        "pxOffsetY": pxOffsetY,
        "seed": seed,
        "visible": visible,
      };
}

///This structure represents a single tile from a given Tileset.
class TileInstance {
  TileInstance({
    this.d,
    this.f,
    this.px,
    this.src,
    this.t,
  });

  ///Internal data used by the editor.<br/>  For auto-layer tiles: `[ruleId, coordId]`.<br/>
  ///For tile-layer tiles: `[coordId]`.
  List<int>? d;

  ///"Flip bits", a 2-bits integer to represent the mirror transformations of the tile.<br/>
  ///- Bit 0 = X flip<br/>   - Bit 1 = Y flip<br/>   Examples: f=0 (no flip), f=1 (X flip
  ///only), f=2 (Y flip only), f=3 (both flips)
  int? f;

  ///Pixel coordinates of the tile in the **layer** (`[x,y]` format). Don't forget optional
  ///layer offsets, if they exist!
  List<int>? px;

  ///Pixel coordinates of the tile in the **tileset** (`[x,y]` format)
  List<int>? src;

  ///The *Tile ID* in the corresponding tileset.
  int? t;

  factory TileInstance.fromRawJson(String str) =>
      TileInstance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TileInstance.fromJson(Map<String, dynamic> json) => TileInstance(
        d: json["d"] == null ? [] : List<int>.from(json["d"]!.map((x) => x)),
        f: json["f"],
        px: json["px"] == null ? [] : List<int>.from(json["px"]!.map((x) => x)),
        src: json["src"] == null
            ? []
            : List<int>.from(json["src"]!.map((x) => x)),
        t: json["t"],
      );

  Map<String, dynamic> toJson() => {
        "d": d == null ? [] : List<dynamic>.from(d!.map((x) => x)),
        "f": f,
        "px": px == null ? [] : List<dynamic>.from(px!.map((x) => x)),
        "src": src == null ? [] : List<dynamic>.from(src!.map((x) => x)),
        "t": t,
      };
}

///This section contains all the level data. It can be found in 2 distinct forms, depending
///on Project current settings:  - If "*Separate level files*" is **disabled** (default):
///full level data is *embedded* inside the main Project JSON file, - If "*Separate level
///files*" is **enabled**: level data is stored in *separate* standalone `.ldtkl` files (one
///per level). In this case, the main Project JSON file will still contain most level data,
///except heavy sections, like the `layerInstances` array (which will be null). The
///`externalRelPath` string points to the `ldtkl` file.  A `ldtkl` file is just a JSON file
///containing exactly what is described below.
class Level {
  Level({
    this.bgColor,
    this.bgPos,
    this.neighbours,
    this.smartColor,
    this.levelBgColor,
    this.bgPivotX,
    this.bgPivotY,
    this.levelBgPos,
    this.bgRelPath,
    this.externalRelPath,
    this.fieldInstances,
    this.identifier,
    this.iid,
    this.layerInstances,
    this.pxHei,
    this.pxWid,
    this.uid,
    this.useAutoIdentifier,
    this.worldDepth,
    this.worldX,
    this.worldY,
  });

  ///Background color of the level (same as `bgColor`, except the default value is
  ///automatically used here if its value is `null`)
  String? bgColor;

  ///Position informations of the background image, if there is one.
  LevelBackgroundPosition? bgPos;

  ///An array listing all other levels touching this one on the world map.<br/>  Only relevant
  ///for world layouts where level spatial positioning is manual (ie. GridVania, Free). For
  ///Horizontal and Vertical layouts, this array is always empty.
  List<NeighbourLevel>? neighbours;

  ///The "guessed" color for this level in the editor, decided using either the background
  ///color or an existing custom field.
  String? smartColor;

  ///Background color of the level. If `null`, the project `defaultLevelBgColor` should be
  ///used.
  String? levelBgColor;

  ///Background image X pivot (0-1)
  double? bgPivotX;

  ///Background image Y pivot (0-1)
  double? bgPivotY;

  ///An enum defining the way the background image (if any) is positioned on the level. See
  ///`__bgPos` for resulting position info. Possible values: &lt;`null`&gt;, `Unscaled`,
  ///`Contain`, `Cover`, `CoverDirty`
  BgPos? levelBgPos;

  ///The *optional* relative path to the level background image.
  String? bgRelPath;

  ///This value is not null if the project option "*Save levels separately*" is enabled. In
  ///this case, this **relative** path points to the level Json file.
  String? externalRelPath;

  ///An array containing this level custom field values.
  List<FieldInstance>? fieldInstances;

  ///User defined unique identifier
  String? identifier;

  ///Unique instance identifier
  String? iid;

  ///An array containing all Layer instances. **IMPORTANT**: if the project option "*Save
  ///levels separately*" is enabled, this field will be `null`.<br/>  This array is **sorted
  ///in display order**: the 1st layer is the top-most and the last is behind.
  List<LayerInstance>? layerInstances;

  ///Height of the level in pixels
  int? pxHei;

  ///Width of the level in pixels
  int? pxWid;

  ///Unique Int identifier
  int? uid;

  ///If TRUE, the level identifier will always automatically use the naming pattern as defined
  ///in `Project.levelNamePattern`. Becomes FALSE if the identifier is manually modified by
  ///user.
  bool? useAutoIdentifier;

  ///Index that represents the "depth" of the level in the world. Default is 0, greater means
  ///"above", lower means "below".<br/>  This value is mostly used for display only and is
  ///intended to make stacking of levels easier to manage.
  int? worldDepth;

  ///World X coordinate in pixels.<br/>  Only relevant for world layouts where level spatial
  ///positioning is manual (ie. GridVania, Free). For Horizontal and Vertical layouts, the
  ///value is always -1 here.
  int? worldX;

  ///World Y coordinate in pixels.<br/>  Only relevant for world layouts where level spatial
  ///positioning is manual (ie. GridVania, Free). For Horizontal and Vertical layouts, the
  ///value is always -1 here.
  int? worldY;

  factory Level.fromRawJson(String str) => Level.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        bgColor: json["__bgColor"],
        bgPos: json["__bgPos"] == null
            ? null
            : LevelBackgroundPosition.fromJson(json["__bgPos"]),
        neighbours: json["__neighbours"] == null
            ? []
            : List<NeighbourLevel>.from(
                json["__neighbours"]!.map((x) => NeighbourLevel.fromJson(x))),
        smartColor: json["__smartColor"],
        levelBgColor: json["bgColor"],
        bgPivotX: json["bgPivotX"]?.toDouble(),
        bgPivotY: json["bgPivotY"]?.toDouble(),
        levelBgPos: bgPosValues.map[json["bgPos"]],
        bgRelPath: json["bgRelPath"],
        externalRelPath: json["externalRelPath"],
        fieldInstances: json["fieldInstances"] == null
            ? []
            : List<FieldInstance>.from(
                json["fieldInstances"]!.map((x) => FieldInstance.fromJson(x))),
        identifier: json["identifier"],
        iid: json["iid"],
        layerInstances: json["layerInstances"] == null
            ? []
            : List<LayerInstance>.from(
                json["layerInstances"]!.map((x) => LayerInstance.fromJson(x))),
        pxHei: json["pxHei"],
        pxWid: json["pxWid"],
        uid: json["uid"],
        useAutoIdentifier: json["useAutoIdentifier"],
        worldDepth: json["worldDepth"],
        worldX: json["worldX"],
        worldY: json["worldY"],
      );

  Map<String, dynamic> toJson() => {
        "__bgColor": bgColor,
        "__bgPos": bgPos?.toJson(),
        "__neighbours": neighbours == null
            ? []
            : List<dynamic>.from(neighbours!.map((x) => x.toJson())),
        "__smartColor": smartColor,
        "bgColor": levelBgColor,
        "bgPivotX": bgPivotX,
        "bgPivotY": bgPivotY,
        "bgPos": bgPosValues.reverse[levelBgPos],
        "bgRelPath": bgRelPath,
        "externalRelPath": externalRelPath,
        "fieldInstances": fieldInstances == null
            ? []
            : List<dynamic>.from(fieldInstances!.map((x) => x.toJson())),
        "identifier": identifier,
        "iid": iid,
        "layerInstances": layerInstances == null
            ? []
            : List<dynamic>.from(layerInstances!.map((x) => x.toJson())),
        "pxHei": pxHei,
        "pxWid": pxWid,
        "uid": uid,
        "useAutoIdentifier": useAutoIdentifier,
        "worldDepth": worldDepth,
        "worldX": worldX,
        "worldY": worldY,
      };
}

///Level background image position info
class LevelBackgroundPosition {
  LevelBackgroundPosition({
    this.cropRect,
    this.scale,
    this.topLeftPx,
  });

  ///An array of 4 float values describing the cropped sub-rectangle of the displayed
  ///background image. This cropping happens when original is larger than the level bounds.
  ///Array format: `[ cropX, cropY, cropWidth, cropHeight ]`
  List<double>? cropRect;

  ///An array containing the `[scaleX,scaleY]` values of the **cropped** background image,
  ///depending on `bgPos` option.
  List<double>? scale;

  ///An array containing the `[x,y]` pixel coordinates of the top-left corner of the
  ///**cropped** background image, depending on `bgPos` option.
  List<int>? topLeftPx;

  factory LevelBackgroundPosition.fromRawJson(String str) =>
      LevelBackgroundPosition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LevelBackgroundPosition.fromJson(Map<String, dynamic> json) =>
      LevelBackgroundPosition(
        cropRect: json["cropRect"] == null
            ? []
            : List<double>.from(json["cropRect"]!.map((x) => x?.toDouble())),
        scale: json["scale"] == null
            ? []
            : List<double>.from(json["scale"]!.map((x) => x?.toDouble())),
        topLeftPx: json["topLeftPx"] == null
            ? []
            : List<int>.from(json["topLeftPx"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "cropRect":
            cropRect == null ? [] : List<dynamic>.from(cropRect!.map((x) => x)),
        "scale": scale == null ? [] : List<dynamic>.from(scale!.map((x) => x)),
        "topLeftPx": topLeftPx == null
            ? []
            : List<dynamic>.from(topLeftPx!.map((x) => x)),
      };
}

enum BgPos { UNSCALED, CONTAIN, COVER, COVER_DIRTY }

final bgPosValues = EnumValues({
  "Contain": BgPos.CONTAIN,
  "Cover": BgPos.COVER,
  "CoverDirty": BgPos.COVER_DIRTY,
  "Unscaled": BgPos.UNSCALED
});

///Nearby level info
class NeighbourLevel {
  NeighbourLevel({
    this.dir,
    this.levelIid,
    this.levelUid,
  });

  ///A single lowercase character tipping on the level location (`n`orth, `s`outh, `w`est,
  ///`e`ast).
  String? dir;

  ///Neighbour Instance Identifier
  String? levelIid;

  ///**WARNING**: this deprecated value is no longer exported since version 1.2.0  Replaced
  ///by: `levelIid`
  int? levelUid;

  factory NeighbourLevel.fromRawJson(String str) =>
      NeighbourLevel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NeighbourLevel.fromJson(Map<String, dynamic> json) => NeighbourLevel(
        dir: json["dir"],
        levelIid: json["levelIid"],
        levelUid: json["levelUid"],
      );

  Map<String, dynamic> toJson() => {
        "dir": dir,
        "levelIid": levelIid,
        "levelUid": levelUid,
      };
}

class LdtkTableOfContentEntry {
  LdtkTableOfContentEntry({
    this.identifier,
    this.instances,
  });

  String? identifier;
  List<ReferenceToAnEntityInstance>? instances;

  factory LdtkTableOfContentEntry.fromRawJson(String str) =>
      LdtkTableOfContentEntry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LdtkTableOfContentEntry.fromJson(Map<String, dynamic> json) =>
      LdtkTableOfContentEntry(
        identifier: json["identifier"],
        instances: json["instances"] == null
            ? []
            : List<ReferenceToAnEntityInstance>.from(json["instances"]!
                .map((x) => ReferenceToAnEntityInstance.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "instances": instances == null
            ? []
            : List<dynamic>.from(instances!.map((x) => x.toJson())),
      };
}

///**IMPORTANT**: this type is not used *yet* in current LDtk version. It's only presented
///here as a preview of a planned feature.  A World contains multiple levels, and it has its
///own layout settings.
class World {
  World({
    this.defaultLevelHeight,
    this.defaultLevelWidth,
    this.identifier,
    this.iid,
    this.levels,
    this.worldGridHeight,
    this.worldGridWidth,
    this.worldLayout,
  });

  ///Default new level height
  int? defaultLevelHeight;

  ///Default new level width
  int? defaultLevelWidth;

  ///User defined unique identifier
  String? identifier;

  ///Unique instance identifer
  String? iid;

  ///All levels from this world. The order of this array is only relevant in
  ///`LinearHorizontal` and `linearVertical` world layouts (see `worldLayout` value).
  ///Otherwise, you should refer to the `worldX`,`worldY` coordinates of each Level.
  List<Level>? levels;

  ///Height of the world grid in pixels.
  int? worldGridHeight;

  ///Width of the world grid in pixels.
  int? worldGridWidth;

  ///An enum that describes how levels are organized in this project (ie. linearly or in a 2D
  ///space). Possible values: `Free`, `GridVania`, `LinearHorizontal`, `LinearVertical`, `null`
  WorldLayout? worldLayout;

  factory World.fromRawJson(String str) => World.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory World.fromJson(Map<String, dynamic> json) => World(
        defaultLevelHeight: json["defaultLevelHeight"],
        defaultLevelWidth: json["defaultLevelWidth"],
        identifier: json["identifier"],
        iid: json["iid"],
        levels: json["levels"] == null
            ? []
            : List<Level>.from(json["levels"]!.map((x) => Level.fromJson(x))),
        worldGridHeight: json["worldGridHeight"],
        worldGridWidth: json["worldGridWidth"],
        worldLayout: worldLayoutValues.map[json["worldLayout"]],
      );

  Map<String, dynamic> toJson() => {
        "defaultLevelHeight": defaultLevelHeight,
        "defaultLevelWidth": defaultLevelWidth,
        "identifier": identifier,
        "iid": iid,
        "levels": levels == null
            ? []
            : List<dynamic>.from(levels!.map((x) => x.toJson())),
        "worldGridHeight": worldGridHeight,
        "worldGridWidth": worldGridWidth,
        "worldLayout": worldLayoutValues.reverse[worldLayout],
      };
}

enum WorldLayout { FREE, GRID_VANIA, LINEAR_HORIZONTAL, LINEAR_VERTICAL }

final worldLayoutValues = EnumValues({
  "Free": WorldLayout.FREE,
  "GridVania": WorldLayout.GRID_VANIA,
  "LinearHorizontal": WorldLayout.LINEAR_HORIZONTAL,
  "LinearVertical": WorldLayout.LINEAR_VERTICAL
});

///Naming convention for Identifiers (first-letter uppercase, full uppercase etc.) Possible
///values: `Capitalize`, `Uppercase`, `Lowercase`, `Free`
enum IdentifierStyle { CAPITALIZE, UPPERCASE, LOWERCASE, FREE }

final identifierStyleValues = EnumValues({
  "Capitalize": IdentifierStyle.CAPITALIZE,
  "Free": IdentifierStyle.FREE,
  "Lowercase": IdentifierStyle.LOWERCASE,
  "Uppercase": IdentifierStyle.UPPERCASE
});

///"Image export" option when saving project. Possible values: `None`, `OneImagePerLayer`,
///`OneImagePerLevel`, `LayersAndLevels`
enum ImageExportMode {
  NONE,
  ONE_IMAGE_PER_LAYER,
  ONE_IMAGE_PER_LEVEL,
  LAYERS_AND_LEVELS
}

final imageExportModeValues = EnumValues({
  "LayersAndLevels": ImageExportMode.LAYERS_AND_LEVELS,
  "None": ImageExportMode.NONE,
  "OneImagePerLayer": ImageExportMode.ONE_IMAGE_PER_LAYER,
  "OneImagePerLevel": ImageExportMode.ONE_IMAGE_PER_LEVEL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

// using { TaskService } from './service';

// //1. Aggregation and analytical annotations
// annotate TaskService.Tasks with @(
//   Aggregation.ApplySupported: {
//     Transformations: [
//       'aggregate',
//       'topcount',
//       'bottomcount',
//       'identity',
//       'concat',
//       'groupby',
//       'filter',
//       'search'      
//     ],
//     GroupableProperties: [
//       taskNumber,
//       requestType,
//       requestNumber,
//       description,
//       assignedTo,
//       status,
//       openedBy,
//       assignedDate,
//       closedDate,
//       comments
//     ],
//     AggregatableProperties: [{
//       $Type : 'Aggregation.AggregatablePropertyType',
//       Property: taskNumber
//     }]
//   },
//   Analytics.AggregatedProperty #totalStock: {
//     $Type : 'Analytics.AggregatedPropertyType',
//     AggregatableProperty : taskNumber,
//     AggregationMethod : 'sum',
//     Name : 'totalStock',
//     ![@Common.Label]: 'Total Tasks'
//   },
//   Aggregation.CustomAggregate #stock: 'Edm.Int32'
// ){
//   taskNumber @Analytics.Measure @Aggregation.default: #SUM
// };

// //2. Main chart
// annotate TaskService.Tasks with @(
//   UI.Chart: {
//     $Type : 'UI.ChartDefinitionType',
//     Title: 'Task Number',
//     ChartType : #Column,
//     Dimensions: [
//       category1,
//       category2
//     ],
//     DimensionAttributes: [{
//       $Type : 'UI.ChartDimensionAttributeType',
//       Dimension: category1,
//       Role: #Category
//     },{
//       $Type : 'UI.ChartDimensionAttributeType',
//       Dimension: category2,
//       Role: #Category2
//     }],
//     DynamicMeasures: [
//       ![@Analytics.AggregatedProperty#totalStock]
//     ],
//     MeasureAttributes: [{
//       $Type: 'UI.ChartMeasureAttributeType',
//       DynamicMeasure: ![@Analytics.AggregatedProperty#totalStock],
//       Role: #Axis1
//     }]
//   },
//   UI.PresentationVariant: {
//     $Type : 'UI.PresentationVariantType',
//     Total: [
//       stock
//     ],
//     Visualizations : [
//         '@UI.Chart',
//     ],
//   }
// );

// //3. Visual Filters
// //category1
// annotate TaskService.Tasks with @(
//   UI.Chart #category1: {
//     $Type : 'UI.ChartDefinitionType',
//     ChartType: #Bar,
//     Dimensions: [
//       category1
//     ],
//     DynamicMeasures: [
//       ![@Analytics.AggregatedProperty#totalStock]
//     ]
//   },
//   UI.PresentationVariant #prevCategory1: {
//     $Type : 'UI.PresentationVariantType',
//     Visualizations : [
//         '@UI.Chart#category1',
//     ],
//   }
// ){
//   category1 @Common.ValueList #vlCategory1: {
//     $Type : 'Common.ValueListType',
//     CollectionPath : 'BooksAnalytics',
//     Parameters: [{
//       $Type : 'Common.ValueListParameterInOut',
//       ValueListProperty : 'category1',
//       LocalDataProperty: category1
//     }],
//     PresentationVariantQualifier: 'prevCategory1'
//   }
// }
// //category2
// annotate TaskService.Tasks with @(
//   UI.Chart #category2: {
//     $Type : 'UI.ChartDefinitionType',
//     ChartType: #Bar,
//     Dimensions: [
//       category2
//     ],
//     DimensionAttributes: [{
//       $Type : 'UI.ChartDimensionAttributeType',
//       Dimension: category2,
//       Role: #Category
//     }],
//     DynamicMeasures: [
//       ![@Analytics.AggregatedProperty#totalStock]
//     ]
//   },
//   UI.PresentationVariant #prevCategory2: {
//     $Type : 'UI.PresentationVariantType',
//     Visualizations : [
//         '@UI.Chart#category2',
//     ],
//   }
// ){
//   category2 @Common.ValueList #vlCategory2: {
//     $Type : 'Common.ValueListType',
//     CollectionPath : 'BooksAnalytics',
//     Parameters: [{
//       $Type : 'Common.ValueListParameterInOut',
//       ValueListProperty : 'category2',
//       LocalDataProperty: category2
//     }],
//     PresentationVariantQualifier: 'prevCategory2'
//   }
// }
// //published at
// annotate TaskService.Tasks with @(
//   UI.Chart #publishedAt: {
//     $Type : 'UI.ChartDefinitionType',
//     ChartType: #Line,
//     Dimensions: [
//       publishedAt
//     ],
//     DimensionAttributes: [{
//       $Type : 'UI.ChartDimensionAttributeType',
//       Dimension: publishedAt,
//       Role: #Category
//     }],
//     DynamicMeasures: [
//       ![@Analytics.AggregatedProperty#totalStock]
//     ]
//   },
//   UI.PresentationVariant #prevPublishedAt: {
//     $Type : 'UI.PresentationVariantType',
//     Visualizations : [
//         '@UI.Chart#publishedAt',
//     ],
//   }
// ){
//   publishedAt @Common.ValueList #vlPublishedAt: {
//     $Type : 'Common.ValueListType',
//     CollectionPath : 'BooksAnalytics',
//     Parameters: [{
//       $Type : 'Common.ValueListParameterInOut',
//       ValueListProperty : 'publishedAt',
//       LocalDataProperty: publishedAt
//     }],
//     PresentationVariantQualifier: 'prevPublishedAt'
//   }
// }

// //4. Selection Fields and Line Item
// annotate TaskService.Tasks with@(
//     UI: {
//         SelectionFields  : [
//             category1,
//             category2,
//             publishedAt
//         ],
//         LineItem: [
//             {  $Type : 'UI.DataField', Value : ID, },
//             {  $Type : 'UI.DataField', Value : title, },
//             {  $Type : 'UI.DataField', Value : category1, },
//             {  $Type : 'UI.DataField', Value : category2, },
//             {  $Type : 'UI.DataField', Value : stock, },
//             {  $Type : 'UI.DataField', Value : publishedAt, },
//         ],
//     }
// );
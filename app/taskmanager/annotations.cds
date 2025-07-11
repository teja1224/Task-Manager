using TaskService as service from '../../srv/service';
using from '../../db/schema';

annotate service.Tasks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Task Number',
                Value : taskNumber,
            },
            {
                $Type : 'UI.DataField',
                Value : requestNumber,
                Label : 'Request Number',
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Value : status.code,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Information2',
            ID : 'Information2',
            Target : '@UI.FieldGroup#Information2',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Task Number',
            Value : taskNumber,
        },
        {
            $Type : 'UI.DataField',
            Value : requestNumber,
            Label : 'Request Number',
        },
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Assigned To',
            Value : assignedTo,
        },
        {
            $Type : 'UI.DataField',
            Value : status.code,
        },
        
    ],
    UI.SelectionFields : [
        status.code,
        requestType.code,
        assignedDate,
    ],
    UI.FieldGroup #Information2 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Opened By',
                Value : openedBy,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Assigned To',
                Value : assignedTo,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Assigned Date',
                Value : assignedDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Comments',
                Value : comments,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Closed Date',
                Value : closedDate,
            },
        ],
    },
);

annotate service.Tasks with {
    changeRequestNumber @Common.Label : '{i18n>ChangeRequestNumber}'
};

annotate service.StatusCodes with {
    code @(
        Common.Label : '{i18n>Status}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'StatusCodes',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : descr,
        Common.Text.@UI.TextArrangement : #TextOnly,
    )
};

annotate service.Tasks with {
    status @Common.ValueListWithFixedValues : true
};

annotate service.RequestTypes with {
    code @(
        Common.Label : 'Request Type',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'RequestTypes',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : descr,
        Common.Text.@UI.TextArrangement : #TextOnly,
        )
};

annotate service.Tasks with {
    assignedDate @Common.Label : 'Assigned Date'
};


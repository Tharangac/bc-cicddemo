pageextension 50100 "**_Customer List_TC" extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;
}
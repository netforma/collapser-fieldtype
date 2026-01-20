import CollapserFieldtype from "./fieldtypes/Collapser.vue";

Statamic.booting(() => {
    Statamic.$components.register("collapser-fieldtype", CollapserFieldtype);
});

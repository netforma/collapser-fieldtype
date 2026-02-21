<script setup>
import { ref, computed, inject } from 'vue';
import { PublishFields, PublishFieldsProvider, publishContextKey, Icon } from '@statamic/cms/ui';

const props = defineProps({
    config: Object,
    meta: Object,
    value: [Object, Array],
    handle: String,
    fieldPathPrefix: String,
    metaPathPrefix: String,
});

const publishContext = inject(publishContextKey, null);

const isOpen = ref(false);

const nestedFieldPathPrefix = computed(() => {
    return props.fieldPathPrefix ? `${props.fieldPathPrefix}.${props.handle}` : props.handle;
});

const nestedMetaPathPrefix = computed(() => {
    return props.metaPathPrefix ? `${props.metaPathPrefix}.${props.handle}` : props.handle;
});

const collapserHasError = computed(() => {
    const prefix = `${nestedFieldPathPrefix.value}.`;
    const errors = publishContext?.errors?.value ?? {};
    return Object.keys(errors).some(handle => handle.startsWith(prefix));
});

function toggle() {
    isOpen.value = !isOpen.value;
}
</script>

<template>
    <div
        class="collapser-fieldtype-container w-full rounded-lg border text-base bg-white dark:bg-gray-900 shadow-ui-md overflow-hidden"
        :class="{
            'border-red-500': collapserHasError,
            'border-gray-300 dark:border-white/10': !collapserHasError
        }"
    >
        <header
            class="flex items-center gap-2 px-3 py-2 cursor-pointer select-none transition-colors duration-150"
            :class="{
                'bg-gray-50 dark:bg-gray-800/50 hover:bg-gray-100 dark:hover:bg-gray-800': !isOpen,
                'bg-gray-100 dark:bg-gray-800': isOpen
            }"
            role="button"
            tabindex="0"
            :aria-expanded="isOpen"
            @click="toggle"
            @keydown.enter="toggle"
            @keydown.space.prevent="toggle"
        >
            <Icon
                name="chevron-right"
                class="size-4 text-gray-500 dark:text-gray-400 transition-transform duration-200"
                :class="{ 'rotate-90': isOpen }"
            />

            <div class="flex-1 min-w-0 font-medium">
                {{ config.display }}
            </div>
        </header>

        <div v-show="isOpen" class="bg-white dark:bg-gray-900">
            <PublishFieldsProvider
                :fields="config.fields"
                :as-config="false"
                :field-path-prefix="nestedFieldPathPrefix"
                :meta-path-prefix="nestedMetaPathPrefix"
            >
                <PublishFields class="p-4" />
            </PublishFieldsProvider>
        </div>
    </div>
</template>

<style>
/* .form-group.collapser-fieldtype {
    padding-top: 0 !important;
} */
</style>
